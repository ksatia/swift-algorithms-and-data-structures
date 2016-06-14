//
//  AlgoDemoViewController.swift
//  Data Structures
//
//  Created by Karan Satia on 5/31/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

var selectionSorter = SelectionSort()
var insertionSorter = InsertionSort()
var binarySearcher = BinarySearch()
let tree = NodelessBST<Int>(array: [15,17,16,25,18,30,9,5,11,3,7])
let tree2 = BinarySearchTree<Int>(array: [14,12,16,15,20])

class AlgoDemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.selectionSort()
        //self.insertionSort()
        //self.binarySearch()
        self.binaryTree()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func selectionSort () {
        var unsortedArray = [3, 6, 1, 25, 300, 2, 10]
        print(selectionSorter.selectionSort(&unsortedArray))
    }

    func insertionSort () {
        var unsortedArray = [9,4,5,1,900,-399]
        print(insertionSorter.insertionSort(&unsortedArray))
    }

    func binarySearch () {
        var unsearchedArray = [9,4,5,1,900,-399, -400]
        // must sort the collection first
        insertionSorter.insertionSort(&unsearchedArray)
        print(binarySearcher.recursiveBinarySearch(unsearchedArray, value: 5))
        print(binarySearcher.genericRecursiveBinarySearch(unsearchedArray, value: 9, range: 0...unsearchedArray.count))
}
    
    func binaryTree () {
        print(tree)
        print(tree2.count)
//        if let node = tree.search(17) {
//            print(tree)
//            node.deleteNode()
//            print(tree)
//        }
//        print(tree2.minimum(self.rootNode).value)
        tree2.deleteNode(14)
        print(tree2)
        
    }
}