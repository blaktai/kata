import Foundation

struct Vertex<T:Equatable & Hashable>: Equatable, Hashable {
  public let data: T
  public let index:Int
}
