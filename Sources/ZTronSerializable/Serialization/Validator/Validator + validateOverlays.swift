import Foundation

extension Validator {
    
    /// Counts the type of overlays in `overlays`.
    ///
    /// - Parameter overlays: The set of overlays to validate
    /// - Returns: `true` if the overlays set is valid, `false` otherwise
    ///
    /// A valid `overlays` set must comply to the following set of rules:
    ///
    /// - At most one bounding circle is contained.
    /// - At most one outline is contained.
    /// - If there's a bounding circle but not an outline, the bounding circle's `idleDiameter` and `normalizedCenter` must **not** be `nil`.
    /// - If there's a bounding circle and an overlay, `normalizedCenter` must be `nil` (will be ignored), but `idleDiameter` can be **not** `nil`.
    ///
    /// - Complexity: **Time:** O(overlays.count). **Memory:** O(overlays.count).
    public static func validateOverlays(_ overlays: [any OverlaySerializableNode]) -> Bool {
        var overlayCountsByType: [OverlayType: Int] = [
            .outline: 0,
            .boundingCircle: 0
        ]
        
        overlays.forEach { overlayNode in
            if let _ = (overlayNode as? SerializableOutlineNode) {
                overlayCountsByType[.outline]? += 1
            } else {
                if let _ = (overlayNode as? SerializableBoundingCircleNode) {
                    overlayCountsByType[.boundingCircle]? += 1
                }
            }
        }
        
        if let outlinesCount = overlayCountsByType[.outline] {
            if outlinesCount > 1 {
                return false
            }
        }
        
        if let boundingCirclesCount = overlayCountsByType[.boundingCircle] {
            if boundingCirclesCount > 1 {
                return false
            } else {
                if boundingCirclesCount == 1 {
                    let outlinesCount = overlayCountsByType[.outline]
                    guard let boundingCircle = (overlays.first { overlay in
                        return (overlay as? SerializableBoundingCircleNode) != nil
                    }) as? SerializableBoundingCircleNode else {
                        fatalError("This route should be impossible in \(#file), please report to github:NickTheFreak97")
                    }

                    if (outlinesCount ?? 0) <= 0 {
                        if boundingCircle.getIdleDiameter() == nil || boundingCircle.getNormalizedCenter() == nil {
                            return false
                        }
                    } else {
                        if boundingCircle.getNormalizedCenter() != nil {
                            return false
                        }
                    }
                }
            }
        }
        
        return true
    }
    
}

fileprivate enum OverlayType: String {
    case outline
    case boundingCircle
    case label
}
