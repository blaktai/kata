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
      let secondNode = LinkedList<Int>.Node(value: 2)
      let firstNode = LinkedList<Int>.Node(value: 1, next: secondNode)
      ll.insert(value: 1)
      ll.insert(value: 2)
      let firstSearch = ll.search(index: 0)
      let secondSearch = ll.search(index: 1)
      XCTAssertEqual(firstSearch, firstNode, "Search didn't find correct node")
      XCTAssertEqual(secondSearch, secondNode, "Search didn't find correct node")
    }
  
    func testRemove() throws {
      var ll = LinkedList<Int>()
      let secondNode = LinkedList<Int>.Node(value: 2)
      let firstNode = LinkedList<Int>.Node(value: 1, next: secondNode)
      ll.insert(value: 1)
      ll.insert(value: 2)
      ll.insert(value: 3)
      ll.insert(value: 4)
      ll.remove(index: 0)
      XCTAssertEqual(ll.first, secondNode, "Second Node was not removed")
    }
    
    func testRemoveLast() throws {
      var ll = LinkedList<Int>()
      let firstNode = LinkedList<Int>.Node(value: 1)
      ll.insert(value: 1)
      ll.insert(value: 2)
      ll.removeLast()
      XCTAssertEqual(ll.first, firstNode, "Second Node was not removed")
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
      var ll = LinkedList<Int>()
      let secondNode = LinkedList<Int>.Node(value: 2)
      ll.insert(value: 1)
      ll.insert(value: 2)
      XCTAssertEqual(ll[1], secondNode, "Second Node was not removed")
    }

}
