//
//  LinkedList.swift
//  Data Structures
//
//  Created by Karan Satia on 5/24/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit


class LinkedList<T> {
    typealias Node = LinkedListNode<T>
    private var count = 0
    private var head: Node?
    var tail: Node?
    
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
                self.addToTail(value)
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
            let newTail = tail.prev
            newTail?.next = nil
            self.tail = newTail
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
                root.next?.prev = nil
                self.head = root.next
                return
            }
            if index == count-1 {
                self.removeItemFromTail()
                return
            }
            else {
                for _ in 0...index-1 {
                    root = root.next!
                }
                root.prev?.next = root.next
                root.next?.prev = root.prev
            }
        }
        count -= 1
    }
    
    func replaceItem (atIndex index: Int, withValue value:T) {
        if count < index || index < 0 {
            print ("index isn't within possible range")
        }
        if var root = self.head {
            if index == 0 {
                root.value = value
                return
            }
            if index == count-1 {
                self.tail?.value = value
                return
            }
            else {
                for _ in 0...index-1 {
                    root = root.next!
                }
                root.value = value
            }
        }
    }

    //change value retrieval function to a subscript
    //we can actually get and set. If you don't include either keyword, it is read-only.
    subscript (index: Int) -> T {
        get {
        //guard statement to catch invalid case. "Guard" the valid case and if not, it's invalid and do something.
        guard  index >= 0 && index < count else {
            fatalError("Index out of range 0 ..< \(count)")
        }
        switch index {
        case 0:
            return head!.value
        case count-1:
            return tail!.value
        default:
            var currentNode = head
            for _ in 0..<index {
                currentNode = currentNode?.next!
            }
            return (currentNode?.value)!
        }
        }
        set (value) {
            return self.replaceItem(atIndex: index, withValue: value)
        }
    }

}


//MARK "PROTOCOL EXTENSIONS"


extension LinkedList : SequenceType {
func generate() -> AnyGenerator<Node> {
    var currentNode = self.head
    return AnyGenerator {
        if let node = currentNode {
            defer { currentNode = node.next }
            return node
        } else {
            return nil
        }
    }
}
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var currentIndex: Int = 0
        var description: String = ""
        if var currentNode = self.head {
       // while currentNode != nil {
            for _ in 0...count-1 {
                //description += (String(currentNode.value) + " " )
                description += ("\"" + (String(currentNode.value)) + "\"" + " is at index: \(currentIndex)\n")
                if let nextNode = currentNode.next {
                currentNode = nextNode
                currentIndex += 1
            }
            }
        }
        return description
}
}