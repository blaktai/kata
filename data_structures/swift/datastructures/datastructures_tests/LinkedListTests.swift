import XCTest
@testable import datastructures
class LinkedListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
  
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
