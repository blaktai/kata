import Foundation

struct LinkedList <T:Equatable> : CustomStringConvertible, IteratorProtocol, Sequence {
  public var description: String {
    guard let first = head else { return Error.emptyList.description }
    return "\(first)"
  }
  private var head: Node<T>?
  private var tail: Node<T>?
  private var currentNode: Node<T>?
  
  public var first: Node<T>?{
    return head
  }
  
  public var last: Node<T>? {
    return tail
  }
  
  public var isEmpty: Bool {
    return head == nil
  }
  
  @discardableResult
  public mutating func insert(value:T) -> Bool{
    let newNode = Node(value: value)
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
  public mutating func insert(at:Int, value:T) -> Bool {
    let newNode = Node(value: value)
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
  
  public func search(index:Int) -> Node<T>?{
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
        current.value = nextElement.value
        return true
      }
      current = nextElement
      counter += 1
    }
    return false
  }
  
  
  @discardableResult
  public mutating func removeLast() -> Bool {
    guard var currentElement = first else { return false }
    if first == last { head = nil; tail = nil; return true }
    while let nextElement = currentElement.next {
      if nextElement == tail {
        tail = currentElement
        currentElement.next = nil
      }
      currentElement = nextElement
    }
    return true
  }
  
  mutating func next() -> Node<T>? {
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
  
  subscript(index:Int) -> Node<T> {
    get {
      var index = index
      guard var currentNode = self.head else {
        fatalError(Error.boundsError.description)
      }
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
      guard var currentNode = self.head else {
        fatalError(Error.boundsError.description)
      }
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

extension LinkedList {
  class Node<T:Equatable>: CustomStringConvertible, Equatable {
    static func == (lhs:Node<T>, rhs:Node<T>) -> Bool {
      return lhs.value == rhs.value && lhs.next == rhs.next
    }
    var description: String {
      guard let next = next else { return "\(value)"}
      return "\(value) -> \(next)"
      
    }
    public var value: T
    public var next: Node?
    
    init(value:T, next:Node? = nil){
      self.value = value
      self.next = next
    }
  }
}

extension LinkedList: CustomStringConvertible {
  enum Error: Swift.Error {
    case emptyList
    case boundsError
    
    var description: String {
      switch self {
      case .emptyList: return "List is empty"
      case .boundsError: return "Index out of bounds"
      }
    }
  }
}
