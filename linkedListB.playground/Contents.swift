//: Playground - noun: a place where people can play

import UIKit

class LinkedListNode <T> {
    var value: T
    private var next: LinkedListNode?
    private var prev: LinkedListNode?
    
    init (value:T ) {
        self.value = value
    }
    
}

class LinkedList<T> {
    typealias Node = LinkedListNode<T>
    private var count = 0
    private var head: Node?
    private var tail: Node?
    
    // isEmpty can simply be a computed property, similar to how it is in CollectionType
    internal var isEmpty: Bool {
        return self.count == 0
    }
    
    internal var sizeOfList: Int {
        return count
    }
    
    
    func addToTail (value:T) {
        let newNode = LinkedListNode(value: value)
        if let tail = tail {
            tail.next = newNode
            newNode.prev = tail
            self.tail = newNode
        }
        else {
            head = newNode
            tail = newNode
        }
        count += 1
    }
    
    //external parameter name being used here. "index" is used internally, argument is named "atIndex" when accessed through API
    func insert (value: T, atIndex index: Int) {
        if count < index || index < 0 {
            print ("index is outside of range")
            return
        }
        let newNode = LinkedListNode(value: value)
        if var root = head {
            if index == 0 {
                self.head = newNode
                self.head!.next = root
            }
            if index == count {
                let tail = self.tail
                tail?.next = newNode
                newNode.prev = tail
                self.tail = newNode
            }
            else {
                for _ in 0...index-1 {
                    root = root.next!
                }
                root.prev?.next = newNode
                newNode.prev = root.prev
                root.prev = newNode
                newNode.next = root
            }
        }
        count += 1
    }
    
    func removeItemFromTail () {
        if let tail = self.tail {
            tail.prev?.next = tail.next
            self.tail = tail.prev
        }
        count -= 1
    }
    
    func removeItem (atIndex index:Int) {
        if count < index || index < 0 {
            print("index isn't within possible range")
            return
        }
        if var root = head {
            if index == 0 {
                root.next?.prev = root.prev
                self.head = root.next
            }
            else {
                for _ in 0...index-1 {
                    root = root.next!
                }
                root.prev?.next = root.next
                root.next?.prev = root.prev
            }
        }
    }
    
    func replaceItem (atIndex index: Int) {
        
    }
    
    func getValue (atIndex index: Int) {
        
    }
    
    
    func printList() {
        var output: String = ""
        var currentNode: Node? = self.head
        while (currentNode != nil) {
            output += String(currentNode!.value)
            currentNode = currentNode!.next
            if (currentNode != nil) {
                output += " -> "
            }
        }
        Swift.print(output)
    }
}

var list = LinkedList<Int> ()
list.addToTail(3)
list.addToTail(8)
list.addToTail(1)
list.addToTail(137)
print(list.sizeOfList)
list.printList()
list.insert(5, atIndex: 4)
list.printList()
