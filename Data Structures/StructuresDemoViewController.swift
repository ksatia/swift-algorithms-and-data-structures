//
//  StructuresDemoViewController.swift
//  Data Structures
//
//  Created by Karan Satia on 5/24/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

var list = LinkedList<String> ()
var newStack = Stack<Int> ()

class StructuresDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.listOperations()
        self.stackOperations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func listOperations () {
        list.addToTail("testing")
        list.addToTail("a")
        list.addToTail("linked list")
        list.addToTail("in swift")
        
        list.removeItem(atIndex: 2)
        list.insert("stack", atIndex: 2)
        print(list)
    }
    
    func stackOperations () {
        newStack.push(5)
        newStack.push(6)
        newStack.push(197)
        newStack.printStack()
        print(newStack.peek())

    }
}
