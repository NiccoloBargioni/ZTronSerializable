import Foundation

extension Validator {
    /// Validates a list of positions. This verifies that all the positions are non-negative and span all the numbers in 0...positions.count-1
    /// with no duplicates.
    ///
    /// - Cost:
    ///     - Time:
    ///         - **Overall:** `Θ(positions.count + max(positions))`, with the following contributions:
    ///             - `O(positions.count)` to preventively verify that all positions are non-negative;
    ///             - `Θ(positions.count + max(positions))` for sorting via countingSort, given by
    ///                 - `Θ(positions.count)` to compute `max(positions)`;
    ///                 - `Θ(positions.count)` to fill counts array
    ///                 - `Θ(max(positions))`  to accumulate counts
    ///                 - `Θ(positions.count)` to populate the sorted array
    ///     - Memory:
    ///         - **Overall** `Θ(positions.count + max(positions))`, with the following contributions:
    ///             - `Θ(max(positions))` for the counts array
    ///             - `Θ(positions.count)` for the sorted array (counting sort doesn't sort in place)
    ///
    ///     Under a typical use case, `max(positions) = positions.count-1` and therefore the time and memory costs are `Θ(positions.count)`.
    ///     The underlying time constant is `5`. Therefore
    ///
    /// - Complexity: O(positions.count + max(positions)) both for space and time. Under typical operating conditions, this becomes O(positions.count)
    public static func validatePositions(_ positions: [Int]) -> Bool {
        if positions.count <= 0 {
            #if DEBUG
            Self.logger.log(
                level: .debug,
                "Attempted to validate an empty positions array. By default an empty array is considered to be sorted, but attempting to write to db an empty array is discouraged."
            )
            #endif
            return true
        }
        
        // Invariant: At the nth iteration, positions[0...n-1] is all non-negative
        for position in positions {
            if position < 0 {
                return false
            }
        }
        
        let sortedPositions = positions.countingSort()
        
        // Invariant: At the nth iteration, sortedPositions[0...n-1] = 0...n-1
        for (i, position) in sortedPositions.enumerated() {
            if position != i {
                return false
            }
        }
        
        return true
    }
}
