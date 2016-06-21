//
//  Queue.swift
//  Data Structures
//
//  Created by Karan Satia on 5/25/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

// we will implement a queue using our linked list
class Queue <T> {
    private var list = LinkedList<T> ()
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    
    func enqueue (value:T) {
        list.addToTail(value)
    }
    
    func dequeue () {
        list.removeItem(atIndex: 0)
    }
    
    // retrieve object at front of queue
    func peek () -> T {
        return list[0]
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return list.description
    }
}
