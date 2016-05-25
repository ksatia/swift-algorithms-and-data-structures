//
//  Stack.swift
//  Data Structures
//
//  Created by Karan Satia on 5/24/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

// we will implement a stack using our linked list
class Stack <T> {
    private var list = LinkedList<T> ()
    
    func push (value: T) {
        list.addToTail(value)
    }
    
    func pop () {
        list.removeItemFromTail()
    }
    
    func peek () -> T {
        let peekIndex = list.sizeOfList-1
        return list.getValue(atIndex: peekIndex)
    }
    
    func printStack() {
        print(list)
    }

    
}
