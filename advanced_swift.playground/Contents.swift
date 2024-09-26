import UIKit

// Task 1: Generics and stuff
// Simplified version of Deque data structure
struct Deque<Element> {
    var items: [Element] = []
    
    mutating func append(_ item: Element) {
        items.append(item)
    }
    
    mutating func appendLeft(_ item: Element) {
        items.insert(item, at: 0)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }
        
        let item = items[items.count - 1]
        items.remove(at: items.count - 1)
        
        return item
    }
    
    mutating func popLeft() -> Element? {
        guard !items.isEmpty else { return nil }

        let item = items[0]
        items.remove(at: 0)
        
        return item
    }
    
    mutating func clear() {
        items.removeAll()
    }
    
    func count() -> Int {
        return items.count
    }
}

// Extension of generic class
extension Deque {
    var reversedList: [Element] {
        return items.reversed()
    }
}

// Creation of Deque
var deq = Deque<String>()

deq.append("Hello")
deq.append("World")

print(deq.items) // ["Hello", "World"]

deq.appendLeft("OMG!")

print(deq.items) // ["OMG!", "Hello", "World"]
print(deq.count()) // 3

print(deq.pop()) // Optional("World")
print(deq.popLeft()) // Optional("OMG!")
print(deq.items) // ["Hello"]

deq.append("Aleksandr")
deq.append("Evdokimov")
print(deq.count()) // 3
print(deq.items) // ["Hello", "Aleksandr", "Evdokimov"]
print(deq.reversedList) // ["Evdokimov", "Aleksandr", "Hello"]

deq.clear()
print(deq.count()) // 0
print(deq.pop()) // nil


// Task 2: Protocols

// Simple Queue protocol with only 2 base methods
protocol Queue {
    associatedtype Element
    
    mutating func push(_ item: Element)
    
    mutating func pop() -> Element?
}

struct StringQueue: Queue {
    typealias Element = String
    
    var items: [String] = []
    
    mutating func push(_ item: String) {
        items.append(item)
    }
    
    mutating func pop() -> String? {
        guard !items.isEmpty else { return nil }
        
        let item = items[items.count - 1]
        items.remove(at: 0)
        
        return item
    }
}

// Example of using StringQueue
var queue = StringQueue()

queue.push("First")
queue.push("Second")
queue.push("Third")

print(queue.items) // ["First", "Second", "Third"]

queue.pop()

print(queue.items) // ["Second", "Third"]


