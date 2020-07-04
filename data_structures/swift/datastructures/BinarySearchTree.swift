import Foundation

class BinarySearchTree<T:Comparable> {
  typealias Element = T
  private var root: Node<T>?
}


// MARK: - BinarySearchTree.Node
extension BinarySearchTree {
  private class Node<T:Comparable> {
    public var left: Node?
    public var right: Node?
    public var value: T
    
    init(value:T, left:Node? = nil, right:Node? = nil) {
      self.value = value
      self.left = left
      self.right = right
    }
  }
}

