import Foundation

public protocol SerializableVisualMediaNode: SerializableNode {
    func getName() -> String
    func getPosition() -> Int
}
