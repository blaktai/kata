import Foundation

class Node<T:Hashable> {
  var value: T
  weak var parent: Node?
  var children: [T:Node] = [:]
  
  init(value:T,parent:Node? = nil){
    self.value = value
    self.parent = parent
  }
  
  public func add(value:T){
    guard children[value] == nil else { return }
    children[value] = Node(value: value, parent: self)
  }
}
