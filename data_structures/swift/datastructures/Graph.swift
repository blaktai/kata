import Foundation

struct Vertex<T:Equatable & Hashable>: Equatable, Hashable {
  public let data: T
  public let index:Int
}

struct Edge<T:Equatable & Hashable>: Equatable, Hashable {
  public let from: Vertex<T>
  public let to: Vertex<T>
  public var weight: Double?
}

protocol Graph {
  associatedtype Element: Hashable & Equatable
  var edges: [Edge<Element>] { get }
  var vertices: [Vertex<Element>] { get }
  func addUndirectedEdge(_ from: Vertex<Element>, _ to: Vertex<Element>, weight: Double?)
  func addDirectedEdge(_ from: Vertex<Element>, _ to: Vertex<Element>, weight: Double?)
  func weightFrom(edge: Edge<Element>) -> Double?
  func edgesFrom(vertex: Vertex<Element>) -> [Edge<Element>]
  func createVertex(data:Element) -> Vertex<Element>
}
