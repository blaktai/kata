import Foundation

class LLNode<T:Equatable>: CustomStringConvertible, Equatable {
  static func == (lhs:LLNode<T>, rhs:LLNode<T>) -> Bool {
    return lhs.value == rhs.value && lhs.next == rhs.next
  }
  var description: String {
    guard let next = next else { return "\(value)"}
    return "\(value) -> \(next)"
    
  }
  public var value: T
  public var next: LLNode?
  
  init(value:T, next:LLNode? = nil){
    self.value = value
    self.next = next
  }
}

struct LinkedList <T:Equatable> : CustomStringConvertible, IteratorProtocol, Sequence {
  public var description: String {
    guard let first = head else { return "list is empty"}
    return "\(first)"
  }
  private var head: LLNode<T>?
  private var tail: LLNode<T>?
  private var currentNode: LLNode<T>?
  
  public var first: LLNode<T>?{
    return head
  }
  
  public var last: LLNode<T>? {
    return tail
  }
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  public mutating func insert(value:T) -> Bool{
    let newNode = LLNode(value: value)
    guard var first = head else {
      head = newNode
      tail = newNode
      return true
    }
    if head == tail {
      tail?.next = newNode
      tail = newNode
      return true
    }
    while (first != tail){
      if first.next == tail {
        first.next?.next = newNode
      }
      first = first.next!
    }
    return true
  }
  
  @discardableResult
  public mutating func insert(at:Int, value:T) -> Bool{
    let newNode = LLNode(value: value)
    guard var first = head else {
      head = newNode
      tail = newNode
      return true
    }
    if head == tail {
      tail?.next = newNode
      tail = newNode
      return true
    }
    while (first != tail){
      if first.next == tail {
        first.next?.next = newNode
      }
      first = first.next!
    }
    return true
  }
  
  public func search(index:Int) -> LLNode<T>?{
    guard !isEmpty else { return nil }
    var first = head
    var counter = 0
    while(head != tail){
      if counter == index {
        return first
      }
      counter += 1
      first = first?.next
    }
    return nil
  }
  
  @discardableResult
  public mutating func remove(index:Int) -> Bool {
    
    guard var current = first else { return false }
    if first == last { head = nil; tail = nil; return true }
    var counter = 0
    while let nextElement = current.next {
      if counter == index {
        current.next = nextElement.next
        return true
      }
      current = nextElement
      counter += 1
    }
    return false
  }
  
  public mutating func removeLast() -> Bool {
    guard var currentElement = first else { return false }
    if first == last { head = nil; tail = nil; return true }
    while currentElement != tail {
      if currentElement.next == tail {
        tail = currentElement
        currentElement.next = nil
      }
      if let nextElement = currentElement.next {
        currentElement = nextElement
      }
    
    }
    return true
  }
  
  internal mutating func next() -> LLNode<T>? {
    guard let currentNode = self.currentNode else {
      self.currentNode = self.first
      return self.currentNode
    }
    while let nextElement = currentNode.next {
      self.currentNode = nextElement
      return nextElement
    }
    return nil
  }
  
  subscript(index:Int) -> LLNode<T> {
    get {
      var index = index
      guard var currentNode = self.head else { fatalError("Index out of bounds") }
      while index > 0 {
        if let nextNode = currentNode.next {
          currentNode = nextNode
        }
        index -= 1
      }
      return currentNode
    }
    set {
      var index = index
      guard var currentNode = self.head else { fatalError("Index out of bounds") }
      while index > 0 {
        if let nextNode = currentNode.next {
          currentNode = nextNode
        } else {
          currentNode.next = newValue
        }
        index -= 1
      }
    }
  }
  
}
