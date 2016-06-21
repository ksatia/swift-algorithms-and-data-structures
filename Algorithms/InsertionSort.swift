//
//  InsertionSort.swift
//  Data Structures
//
//  Created by Karan Satia on 5/31/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class InsertionSort: NSObject {

    // insertion sort takes an array and divides it into a sorted and unsorted portion. We can disregard the first element, since a single element collection is already sorted. We then take the next index in the unsorted portion and compare it to the rightmost element of the sorted portion. If it is smaller, we move down an element to the left and compare it there, until we find the correct place to INSERT it.
    
    
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
            // take current index element and look at all elements before it. If our current index element is less than previous ones,
            // call our swap function. Move down an element and continue. When we've looked at all elements, we return to 
            // the first for loop and move to the next element, expanding the "sorted" portion and reducing size of "unsorted" portion.
            for n in i.stride(to: 0, by: -1) {
                if array[n] < array[n-1] {
                    swap(&array, firstIndex: n, secondIndex: (n-1))
                }
            }
            
        }
        return array
    }
}
