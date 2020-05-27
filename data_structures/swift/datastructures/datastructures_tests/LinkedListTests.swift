import XCTest
@testable import datastructures
class LinkedListTests: XCTestCase {
  
    func testInsert() throws {
      var ll = LinkedList<Int>()
      ll.insert(value: 1)
      XCTAssertEqual(!ll.isEmpty, true, "Linked List is not Empty")
      XCTAssertEqual(ll.first, ll.last, "Head doesn't equal tail")
    }
  
    func testSearch() throws {
      var ll = LinkedList<Int>()
      let secondNode = LLNode(value: 2)
      let firstNode = LLNode(value: 1, next: secondNode)
      ll.insert(value: 1)
      ll.insert(value: 2)
      let firstSearch = ll.search(index: 0)
      let secondSearch = ll.search(index: 1)
      XCTAssertEqual(firstSearch, firstNode, "Search didn't find correct node")
      XCTAssertEqual(secondSearch, secondNode, "Search didn't find correct node")
    }
  
    func testRemove() throws {
      
    }
    
    func testRemoveLast() throws {
      
    }
  
    func testIsEmpty() throws {
      
    }
  
    func testFirst() throws {
      
    }
    
    func testLast() throws {
      
    }
  
    func testIterator() throws {
      
    }
    
    func testSubscript() throws {
      
    }

}
