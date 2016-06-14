////
////  lowLevelStack.swift
////  Data Structures
////
////  Created by Karan Satia on 5/25/16.
////  Copyright © 2016 Karan Satia. All rights reserved.
////
//
//protocol StackType {
//    typealias Element
//    mutating func push(element: Element)
//    mutating func pop() -> Element?
//}
//
//final class BufferStorage<Element> {
//    
//    private var ptr: UnsafeMutablePointer<Element>
//    private let capacity: Int
//    
//    init(capacity: Int) {
//        ptr = UnsafeMutablePointer<Element>.alloc(capacity)
//        self.capacity = capacity
//    }
//    
//    static func copy(buffer: BufferStorage<Element>, count: Int) -> BufferStorage<Element> {
//        let storage = BufferStorage<Element>(capacity: buffer.capacity)
//        storage.ptr.initializeFrom(buffer.ptr, count: count)
//        return storage
//    }
//    
//    func add(element: Element, at position: Int) {
//        (ptr + position).initialize(element)
//    }
//    
//    func removeAt(position: Int) -> Element {
//        let item = (ptr + position).memory
//        (ptr + position).destroy()
//        return item
//    }
//    
//    func itemAt(position: Int) -> Element {
//        return (ptr + position).memory
//    }
//    
//    deinit {
//        print("de intiialized")
//        ptr.destroy(capacity)
//        ptr.dealloc(capacity)
//    }
//}
//
//struct Stack<Element>: StackType {
//    
//    private var buffer: BufferStorage<Element>
//    private var top = 0
//    
//    init(capacity: Int = 50) {
//        buffer = BufferStorage(capacity: capacity)
//    }
//    
//    mutating func push(element: Element) {
//        if !isUniquelyReferencedNonObjC(&buffer) {
//            buffer = BufferStorage.copy(buffer, count: top)
//        }
//        buffer.add(element, at: top)
//        top = top + 1
//    }
//    
//    mutating func pop() -> Element? {
//        guard top > 0 else {
//            return nil
//        }
//        if !isUniquelyReferencedNonObjC(&buffer) {
//            buffer = BufferStorage.copy(buffer, count: top)
//        }
//        let item = buffer.removeAt(top-1)
//        top = top - 1
//        return item
//    }
//}
//
//extension Stack: CustomStringConvertible {
//    var description: String {
//        guard top > 0 else {
//            return "[]"
//        }
//        var str = "["
//        for x in 0..<top-1 {
//            str = str + "\((buffer.itemAt(x))), "
//        }
//        str = str + "\(buffer.itemAt(top-1))" + "]"
//        return str
//    }
//}
//
//
//struct StackGenerator<Element>: GeneratorType {
//    var stack: Stack<Element>
//    mutating func next() -> Element? {
//        return stack.pop()
//    }
//}
//
//extension Stack: SequenceType {
//    func generate() -> StackGenerator<Element> {
//        return StackGenerator<Element>(stack: self)
//    }
//}
//
//var intStack = Stack<Int>()
//intStack.push(1)
//intStack.push(2)
//intStack.push(3)
//intStack.push(4)
//intStack.push(5)
//
//var newIntStack = intStack
//print("Stacks before popping from new stack original: \(intStack) new: \(newIntStack)")
//newIntStack.pop()
//print("Stacks after popping from new stack original: \(intStack) new: \(newIntStack)")
//
//print("Printing stack")
//for x in newIntStack {
//    print(x)
//}
//
//let stackValuesMultipliedByTwo = newIntStack.map { $0 * 2 }
//
//class DemoClass: CustomStringConvertible {
//    let tag: Int
//    init(_ tag: Int) {
//        self.tag = tag
//    }
//    deinit {
//        print("removing...\(tag)")
//    }
//    var description: String {
//        return "#\(tag)"
//    }
//}
//
//var classStack = Stack<DemoClass>()
//classStack.push(DemoClass(1))
//classStack.push(DemoClass(2))
//
//var newClassStack = classStack
//newClassStack.pop()
//classStack.pop()
//
