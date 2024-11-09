import Testing
import XCTest
@testable import ZTronSerializable

@Test func testCountingSort() async throws {
    
    let array = [2,3,2,5,7,3,1,3,5]
    let sortedArray = array.countingSort()
    
    for i in 1..<sortedArray.count {
        XCTAssertTrue(sortedArray[i-1] <= sortedArray[i])
    }
    
    let allNegativeArray = [-2,-3,-2,-5,-7,-3,-1,-3,-5]
    let allNegativeSortedArray = allNegativeArray.countingSort()
    
    for i in 1..<allNegativeSortedArray.count {
        XCTAssertTrue(allNegativeSortedArray[i-1] <= allNegativeSortedArray[i])
    }

    let mixedArray = [-2,-3,-2,-5,7,3,1,3,5]
    let sortedMixedArray = mixedArray.countingSort()
    
    for i in 1..<sortedMixedArray.count {
        XCTAssertTrue(sortedMixedArray[i-1] <= sortedMixedArray[i])
    }
    
}
