//
//  BinarySearch.swift
//  Data Structures
//
//  Created by Karan Satia on 6/1/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class BinarySearch: NSObject {
    
    // non resursive solution
    func binarySearch (array: [Int], value: Int) -> Int? {
        guard array.count>1 else { return nil }
        var low = 0, high = array.count
        while low<high {
            switch (low+high)/2 {
            case let mid where array[mid] > value:
                high = (mid-1)
            case let mid where array[mid] < value:
                low = (mid+1)
            case let mid:
                return mid
            }
        }
        return nil
    }
    
    // recursive solution
    func recursiveBinarySearch (array:[Int], value: Int) -> Int? {
        // for a recursive binary search to work, we need a function that takes low and high as parameters. If we had a single function that took a low and high, and within the function we set low = 0 and high = array.count-1, then when we resursively call the function, we are resetting the low to 0 and the high to array.count-1 every time. 
        // In order to bypass this issue, we can simply take an array and value to search for, call a different function that has low and high as arguments, and pass in our initial values. Hack-ish but works.
         return self._resursiveBinarySearch(array, value: value, low: 0, high: array.count)
    }

    private func _resursiveBinarySearch (array: [Int], value: Int, low: Int, high: Int) -> Int? {
        // if the high = low, we have checked every element -> continue check to see if the last element (array[low] or array[high]) is equal to the value we're searching for
        guard low <= high else {return nil}
        let mid = low + ((high-low)/2)
        switch mid {
        case let midPoint where array[midPoint] > value:
            return _resursiveBinarySearch(array, value: value, low: low, high: midPoint-1)
        case let midPoint where array[midPoint] < value:
            return _resursiveBinarySearch(array, value: value, low: midPoint+1, high: high)
        case let midPoint where array[midPoint] == value:
            return midPoint
        default:
            return mid
        }
        
        /*        if array[mid] > value {
                    return _resursiveBinarySearch(array, value: value, low: low, high: mid-1)
                }
                else if array[mid] < value {
                    return _resursiveBinarySearch(array, value: value, low: mid+1, high: high)
                }
                else {
                    return mid
                }
        */
    }
}