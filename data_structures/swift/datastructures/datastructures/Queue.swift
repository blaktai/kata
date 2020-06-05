import Foundation

struct Queue<T> {
    private var items = [T]()
    
    mutating public func enqueue(item:T){
        items.append(item)
    }
    
    @discardableResult
    mutating public func dequeue() -> T? {
        return items.popLast()
    }
}

protocol Queueable {
    func enqueue()
    func dequeue()
}
