import Foundation

public protocol SerializableVisualMediaNode: SerializableNode {
    func getName() -> String
    func getPosition() -> Int
    func getDescription() -> String
    func getSearchLabel() -> String?
}
