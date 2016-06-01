//
//  SelectionSort.swift
//  Data Structures
//
//  Created by Karan Satia on 5/31/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class SelectionSort: NSObject {
    // selection sort starts at the first index in a collection and compares it to all others. We try to find the minimum index. If the first index is not the minimum, we swap them so that the smallest element in the array is now first. Once the first swap is complete, we know the first element is now the smallest. We can now focus on everything EXCEPT the first element. Once the second iteration is done, we can focus on everything EXCEPT the first & second element, etc.
    // we are SELECTING the lowest element, then the next lowest, then the next lowest, and placing them accordingly. 
    

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
