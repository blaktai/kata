import XCTest
@testable import datastructures

class StackTests: XCTestCase {
  
  func testPush() throws {
    var stack = StackArray<Int>()
    let value = 1
    stack.push(value:value)
    XCTAssertEqual(stack.count, 1)
  }
  
  func testPop() throws {
    var stack = StackLL<Int>()
    let value = 1
    stack.push(value:value)
    XCTAssertEqual(stack.pop(), value)
  }
  
  func testPopLL() throws {
    var stack = StackLL<Int>()
    let value = 1
    stack.push(value:value)
    XCTAssertEqual(stack.pop(), value)
  }
}
