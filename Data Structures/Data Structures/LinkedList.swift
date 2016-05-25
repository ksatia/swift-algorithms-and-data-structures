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
                root.next?.prev = nil
                self.head = root.next
                return
            }
            if index == count {
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
    
    func getValue (atIndex index: Int) -> T {
        if count < index || index < 0 {
            print ("index is outside of possible range")
        }
        var root = self.head
        //        if var root = self.head {
        if index == 0 {
            return (self.head?.value)!
        }
        if index == count-1 {
            return (self.tail?.value)!
        }
        else {
            for _ in 0...index-1 {
                root = root!.next!
            }
        }
        return root!.value
    }
    
    
//    func printList() {
//        var output: String = ""
//        var currentNode: Node? = self.head
//        while (currentNode != nil) {
//            output += String(currentNode!.value)
//            currentNode = currentNode!.next
//            if (currentNode != nil) {
//                output += " -> "
//            }
//        }
//        Swift.print(output)
//    }
    
}

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
        var description: String = ""
        if var currentNode = self.head {
       // while currentNode != nil {
            for _ in 0...count-1 {
            description += (String(currentNode.value) + " " )
            if let nextNode = currentNode.next {
                currentNode = nextNode
            }
            }
        }
        return description
}
}

        
        
        
        
        
//            if var currentNode = head {
//                description += String(currentNode.value)
//                for _ in 0...self.count-1 {
//                while var node = currentNode.next {
//                    description += (" " + String(node.value))    //String("(\currentNode.value) ")
//                    node = node.next!
//                }
//                }
//        }
//        return description
//        }
//    }

