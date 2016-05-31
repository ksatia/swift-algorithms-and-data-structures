//
//  SelectionSort.swift
//  Data Structures
//
//  Created by Karan Satia on 5/31/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class SelectionSort: NSObject {

    // simple swap function using reassignment instead of memory swapping
    func swap (inout array: [Int], firstIndex: Int, secondIndex:Int) {
        let temp = array[firstIndex]
        array[firstIndex] = array[secondIndex]
        array[secondIndex] = temp
    }
    
    func selectionSort (inout array: [Int]) -> Array<Int> {
        var minimumElement: Int
        for n in 0..<array.count { // loops from 0 to n-1
            // set minimum element equal to starting index being used for iteration
            minimumElement = n
            // iterate over the remaining elements
            for x in n+1..<array.count {
                // if any of the elements being iterated over are less than our minimum, reassign the minimum index
                if array[x] < array[minimumElement] {
                    minimumElement = x
                }
            }
            // if our new minimum if different from the first element in the unsorted portion of our array, swap them
            if minimumElement != n {
                swap(&array, firstIndex: n, secondIndex: minimumElement)
            }
        }
        return array
    }
    
}
