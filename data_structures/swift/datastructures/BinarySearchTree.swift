import Foundation

class BinarySearchTree<T:Comparable>: IteratorProtocol, Sequence {
  typealias Element = T
  private var root: Node<T>?
  private var currentNode: Node<T>?
  public func contains(_ value:T) -> Bool {
    return search(value)?.value == value
  }

  private func search(_ value:T) -> Node<T>? {
    guard let root = self.root else { return nil }
    return search(value, node: root)
  }
  
  private func search(_ value:T, node:Node<T>) -> Node<T>? {
    if node.value == value {
      return node
    } else if let rightNode = node.right, value > node.value {
      return search(value, node: rightNode)
    } else if let leftNode = node.left,  value <= node.value  {
      return search(value, node: leftNode)
    }
    return nil
  }
  
  public func insert(_ value:T) {
    let newNode = Node(value: value)
    guard let currentNode = self.root else { self.root = newNode; return }
    insert(node: currentNode, newNode: newNode)
  }
  
  private func insert(node:Node<T>, newNode:Node<T>) {
    if node.value > newNode.value && node.left == nil {
      node.left = newNode
    } else if node.value <= newNode.value && node.right == nil {
      node.right = newNode
    } else if node.value > newNode.value {
      insert(node: node.left!, newNode: newNode)
    } else {
      insert(node: node.right!, newNode: newNode)
    }
  }
  
  public func max<T>() -> T? {
    guard let currentNode = self.root else { return nil }
    return (max(node: currentNode).value as? T)
  }
  
  private func max<T>(node:Node<T>) -> Node<T> {
    return node.right == nil ? node : max(node: node.right!)
  }
  
  public func min() -> T? {
    guard let currentNode = self.root else { return nil }
    return min(node: currentNode).value
  }
  
  private func min<T>(node:Node<T>) -> Node<T> {
    return node.left == nil ? node : min(node: node.left!)
  }
  
  public func next() -> T? {
    guard let currentNode = self.currentNode else {
      self.currentNode = self.root
      return self.currentNode?.value
    }
    while let nextElement = currentNode.next {
      self.currentNode = nextElement
      return nextElement.value
    }
    return nil
  }
}

// MARK: - BinarySearchTree.Traversal
extension BinarySearchTree {
  private enum Traversal {
    case inOrder
    case preOrder
    case postOrder
  }
}


// MARK: - BinarySearchTree.Node
extension BinarySearchTree {
  private class Node<T:Comparable> {
    public var left: Node?
    public var right: Node?
    public var value: T
    fileprivate var next: Node<T>? {
      return left != nil ? left : right
    }
    
    init(value:T, left:Node? = nil, right:Node? = nil) {
      self.value = value
      self.left = left
      self.right = right
    }
  }
}
