import Foundation

class Trie {
  fileprivate var root: Node<Character>
  init(_ char:Character){
    self.root = Node(value: char)
  }
  
  public func contains(word:String) -> Bool {
    guard let firstChar = word.first,
      var currentNode = root.children[firstChar] else { return false }
    
    for (idx, char) in word.enumerated() where idx != 0 {
      guard let node = currentNode.children[char] else { return false }
      currentNode = node
    }
    return true 
  }
}

extension Trie {
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
}
