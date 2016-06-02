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

class AlgoDemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectionSort()
        self.insertionSort()
        self.binarySearch()
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
        var unsearchedArray = [9,4,5,1,900,-399]
        // must sort the collection first
        insertionSorter.insertionSort(&unsearchedArray)
        print(binarySearcher.binarySearch(unsearchedArray, value: 99999))
    }
}
