//
//  SelectionSort.swift
//  Data Structures
//
//  Created by Karan Satia on 5/31/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class SelectionSort: NSObject {

    // we must pass the address of the array to our inout swap function. aka swap(&array, 2, 5)
    func swap (inout array: [Int], firstIndex: Int, secondIndex:Int) {
        let temp = array[firstIndex]
        array[firstIndex] = array[secondIndex]
        array[secondIndex] = temp
    }
    
    func selectionSort (inout array: [Int]) -> Array<Int> {
        var minimumElement: Int
        for n in 0..<array.count { // loops from 0 to n-1
            minimumElement = n
            for x in n+1..<array.count {
                if array[x] < array[minimumElement] {
                    minimumElement = x
                }
            }
            if minimumElement != n {
                swap(&array, firstIndex: n, secondIndex: minimumElement)
            }
        }
        return array
    }
    
}
