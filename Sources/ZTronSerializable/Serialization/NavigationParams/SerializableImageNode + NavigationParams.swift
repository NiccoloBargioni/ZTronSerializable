import Foundation

extension SerializableImageNode {
    public class NavigationParameters: CustomStringConvertible {
        private(set) public var description: String
        
        @Lowercased private var bottomBarIcon: String
        @NullableLowercased private var goBackBottomBarIcon: String?
        private let boundingFrame: CGRect?

        
        public init(bottomBarIcon: String, goBackBottomBarIcon: String? = nil, boundingFrame: CGRect? = nil) {
            self.bottomBarIcon = bottomBarIcon
            self.goBackBottomBarIcon = goBackBottomBarIcon
            self.boundingFrame = boundingFrame
            
            self.description = """
                ImageParameter(
                    bottomBarIcon: \(bottomBarIcon),
                    goBackBottomBarIcon: \(String(describing: goBackBottomBarIcon))
                    boundingFrame: \(String(describing: boundingFrame))
                )
            """
        }
        
        public func getBottomBarIcon() -> String {
            return self.bottomBarIcon
        }
        
        public func getGoBackBottomBarIcon() -> String? {
            return self.goBackBottomBarIcon
        }
        
        public func getBoundingFrame() -> CGRect? {
            guard let boundingFrame = self.boundingFrame else { return nil }
            return CGRect(origin: boundingFrame.origin, size: boundingFrame.size)
        }
    }
}
