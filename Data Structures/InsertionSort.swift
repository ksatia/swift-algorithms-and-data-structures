//
//  InsertionSort.swift
//  Data Structures
//
//  Created by Karan Satia on 5/31/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class InsertionSort: NSObject {

    /*
     DECREMENTING SYNTAX FOR SWIFT
    func insertionSort {
        for n in 10.stride(to: 0, by: -1) {
            while current item in unsorted array is less than n, call a swap function
        }
    */
    func swap (inout array: [Int], firstIndex: Int, secondIndex:Int) {
        let temp = array[firstIndex]
        array[firstIndex] = array[secondIndex]
        array[secondIndex] = temp
    }
    
    func insertionSort (inout array: [Int]) -> Array<Int> {
        // make sure we have more than 1 element otherwise simply return the array.
        // a single element collection is already sorted
        guard array.count > 1 else {return array}
        
        // iterate over each element, ignoring the first one since it's sorted by itself
        for i in 1..<array.count {
            // for first iteration, n = 1, then 2...
            for n in i.stride(to: 0, by: -1) {
                if array[n] < array[n-1] {
                    swap(&array, firstIndex: n, secondIndex: (n-1))
                }
            }
            
        }
        return array
    }
}
