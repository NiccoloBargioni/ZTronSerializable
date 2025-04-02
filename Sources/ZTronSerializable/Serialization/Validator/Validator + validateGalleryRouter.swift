import Foundation
import ZTronRouter

extension Validator {
    public typealias GalleryRouter = ZTronRouter<Empty, SerializableGalleryNode, Empty>
    
    /// Validates the tree of all the galleries inside a specific tool.
    ///
    /// - Parameter galleryRouter: The gallery router to validate.
    /// - Parameter validateImages: if `true`, all the images in all the subgalleries are validated as well.
    /// - Returns: `true` if `galleryRouter` is a valid router, `false` otherwise.
    ///
    /// The router must comply to the following rules in order to be considered valid:
    ///
    /// - All the subgalleries of a same gallery either must all have `assetsImageName != nil` or `assetsImageName == nil`
    /// - All the leaf galleries must have at least one associated image.
    /// - All the positions sets must be valid in the sense of `validatePosition`.
    ///
    /// - Complexity: **Time:** O(V) to aggregate positions and images, O(V) to validate them. **Memory:** O(V) to topologically
    /// iterate over the collection of nodes. If `i` is the maximum number of images inside any gallery and `validateImages == true`, both
    /// time and memory become O(V⋅i)
    public static func validateGalleryRouter(_ galleryRouter: GalleryRouter, validateImages: Bool) -> Bool {
        
        var positionsMap: [Array<String>.SubSequence: [Int]] = [:]
        var assetsImageNamesMap: [Array<String>.SubSequence: [String?]] = [:]
        
        do {
            try galleryRouter.forEach { absolutePath, output in
                let parentPath = absolutePath.dropLast()

                if positionsMap[parentPath] == nil {
                    positionsMap[parentPath] = []
                }
                
                positionsMap[parentPath]?.append(output.getPosition())
                
                if assetsImageNamesMap[parentPath] == nil {
                    assetsImageNamesMap[parentPath] = []
                }
                
                assetsImageNamesMap[parentPath]?.append(output.getAssetsImageName())
                
                if validateImages {
                    if !Validator.validateMediasRouter(output.getMedias()) {
                        throw ValidateImagesRouterError.interruptSearch(
                            reason: "Could not validate images router for \(output.getName())"
                        )
                    }
                }
            }
        } catch ValidateImagesRouterError.interruptSearch(let reason) {
            #if DEBUG
            Self.logger.log(level: .error, "\(reason)")
            #endif
            return false
        } catch {
            fatalError("Path should be unfeasible in \(#file): \(#function), please reach out to github:NickTheFreak97")
        }
        
        for positionsSet in positionsMap.values {
            if !Validator.validatePositions(positionsSet) {
                return false
            }
        }
                
        for assetsImageNamesSet in assetsImageNamesMap.values {
            if !self.validateAssetsImages(assetsImageNamesSet) {
                return false
            }
        }
 
        return true
    }
    
    fileprivate static func validateAssetsImages(_ imagesNames: [String?]) -> Bool {
        for imagesName in imagesNames {
            if imagesNames.first == nil && imagesName != nil {
                return false
            } else {
                if imagesNames.first != nil && imagesName == nil {
                    return false
                }
            }
        }
        
        return true
    }
}

fileprivate enum ValidateImagesRouterError: Error {
    case interruptSearch(reason: String)
}
