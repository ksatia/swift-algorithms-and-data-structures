//
//  StructuresDemoViewController.swift
//  Data Structures
//
//  Created by Karan Satia on 5/24/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

var linkedList = LinkedList<String> ()
var newStack = Stack<Int> ()
var newQueue = Queue<String> ()

class StructuresDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.listOperations()
        //self.stackOperations()
        //self.queueOperations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func listOperations () {
        linkedList.addToTail("testing")
        linkedList.addToTail("a")
        linkedList.addToTail("linked list")
        linkedList.addToTail("in swift")
        
        //linkedList.removeItem(atIndex: 2)
        
        //test subscript setter and getter
        print("The value at this location is \"\(linkedList[2])\"\n")
        
        linkedList[0] = "creating"
        
        print(linkedList)
        
        //make sure sizeOfList var returns properly in a subscript GET
        print(linkedList[(linkedList.sizeOfList-1)])
        linkedList.removeItem(atIndex: 4)
    }
    
    func stackOperations () {
        newStack.push(5)
        newStack.push(6)
        newStack.push(197)
        print(newStack.peek())
        print(newStack)
    }
    
    func queueOperations () {
        newQueue.enqueue("this")
        newQueue.enqueue("is")
        newQueue.enqueue("a")
        newQueue.enqueue("queue")
        newQueue.enqueue("test")
        newQueue.dequeue()
        print(newQueue)
    }
}
