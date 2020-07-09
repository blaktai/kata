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
