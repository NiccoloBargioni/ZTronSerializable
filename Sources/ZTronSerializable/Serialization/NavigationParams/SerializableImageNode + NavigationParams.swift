import Foundation

extension SerializableImageNode {
    public class NavigationParameters: CustomStringConvertible {
        public var description: String
        
        @Lowercased private var bottomBarIcon: String
        private let boundingFrame: CGRect?

        
        init(bottomBarIcon: String, boundingFrame: CGRect? = nil) {
            self.bottomBarIcon = bottomBarIcon
            self.boundingFrame = boundingFrame
            
            self.description = """
                ImageParameter(
                    bottomBarIcon: \(bottomBarIcon),
                    boundingFrame: \(String(describing: boundingFrame))
                )
            """
        }
        
        public func getBottomBarIcon() -> String {
            return self.bottomBarIcon
        }
        
        public func getBoundingFrame() -> CGRect? {
            return self.boundingFrame
        }
    }
}
