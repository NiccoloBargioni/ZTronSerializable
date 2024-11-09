import Foundation


internal extension Array where Element == Int {
    func countingSort() -> Self {
        return ZTronSerializable.countingSort(self)
    }
}
