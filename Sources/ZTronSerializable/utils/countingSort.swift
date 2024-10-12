import Foundation

/// Sorts an array of non-negative integers. The non-negativity is not enforced by this function and must be guaranteed by the caller,
///
/// - Complexity: O(array.count + max(array)) for both space and time.
public func countingSort(_ array: [Int])-> [Int] {
  guard array.count > 0 else { return [] }

    let maxElement = array.max() ?? 0

    var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
    
    for element in array {
        countArray[element] += 1
    }

    for index in 1 ..< countArray.count {
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum
    }

    var sortedArray = [Int](repeating: 0, count: array.count)
        
    for index in stride(from: array.count - 1, through: 0, by: -1) {
        let element = array[index]
        countArray[element] -= 1
        sortedArray[countArray[element]] = element
    }

    return sortedArray
}
