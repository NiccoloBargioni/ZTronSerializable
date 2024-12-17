import Foundation

internal extension Array {
    static func array(subsequence: Self.SubSequence) -> Self {
        return Array(subsequence)
    }
}
