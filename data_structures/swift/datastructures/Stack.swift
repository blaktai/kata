import Foundation

struct StackLL<T:Equatable> {
  private var items = LinkedList<T>()
  
  public mutating func push(value:T){
    items.insert(value:value)
  }
  
  @discardableResult
  public mutating func pop() -> T? {
    return items.popLast()
  }
}

struct StackArray<T> {
  private var items = [T]()
  
  public var count: Int { return items.count }
  
  mutating public func pop() -> T? {
    guard items.count > 0 else { return nil }
    return items.removeLast()
  }
  
  mutating public func push(value:T){
    items.append(value)
  }
}
