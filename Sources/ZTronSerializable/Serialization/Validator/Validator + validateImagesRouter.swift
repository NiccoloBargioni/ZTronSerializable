import Foundation

extension Validator {
    
    /// Validates the tree of all the images inside a specific subgallery
    ///
    /// - Parameter router: The router to validate.
    /// - Returns: `true` if the argument is a valid image router, `false` otherwise.
    ///
    /// The router must comply to the following rules in order to be considered valid:
    ///
    /// - The positions must be valid (in the sense of `validatePositions`) for all the neighbours of every image.
    /// - If an image is a variant, it must have a `bottomBarIcon` parameter associated to it.
    /// - If the image is a variant, a `boundingFrame` must be provided.
    /// - For top level images, the name of the image must match the name of the path component. For instance an image called `SpacelandSign`
    /// that is not a `slave`, must go under the path `['>', 'SpacelandSign']`.
    ///
    /// - Complexity: **Time:** O(V) to topologically iterate over the images collection. **Memory:** O(V) for the same reason.
    public static func validateImagesRouter(_ router: SerializableGalleryNode.ImagesRouter) -> Bool {
        var subpositions: [Array<String>.SubSequence: [Int]] = [:]
        
        do {
            try router.forEach { absolutePath, image, parameter in
                let parentPath = absolutePath.dropLast()
                
                if subpositions[parentPath] == nil {
                    subpositions[parentPath] = []
                }
                
                subpositions[parentPath]!.append(image.getPosition())
                
                if absolutePath.count == 2 {
                    let imageName = image.getName()
                    
                    if imageName != absolutePath.last {
                        throw ValidateImagesRouterError.interruptSearch(
                            reason: "\(imageName) should be hosted at ['>', '\(imageName)'] instead of \(absolutePath)"
                        )
                    }
                }
                
                if absolutePath.count > 2 {
                    if let parameter = parameter {
                        if parameter.getBoundingFrame() == nil {
                            throw ValidateImagesRouterError.interruptSearch(
                                reason: "Variants must provide an associated bounding frame to describe how it overlays its parent image."
                            )
                        }
                    } else {
                        throw ValidateImagesRouterError.interruptSearch(
                            reason: "Variants must have parameters associated with them"
                        )
                    }
                }
                
            }
        } catch ValidateImagesRouterError.interruptSearch(let reason) {
            print(reason)
            return false
        } catch {
            fatalError("This path should be impossible in \(#file), please reach out to github:NickTheFreak97.")
        }
        
        for positions in subpositions.values {
            if !Validator.validatePositions(positions) {
                print("could not validate positions set \(countingSort(positions))")
                return false
            }
        }
        
        return true
    }
    
}

fileprivate enum ValidateImagesRouterError: Error {
    case interruptSearch(reason: String)
}
