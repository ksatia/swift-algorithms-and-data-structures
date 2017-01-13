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
    func binarySearch (_ array: [Int], value: Int) -> Int? {
        guard array.count>1 else { return nil }
        // set low and high variables instead of passing in as arguments back to the function
        var low = 0, high = array.count
        // if low >= high, that means we've adjusted each end of the array to the point where we've checked everything and the key isn't in the array
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
    // "_" before argument name indicates that we can call function without having to see the actual parameter name, we can just pass in the value
    func recursiveBinarySearch (_ array:[Int], value: Int) -> Int? {
        // We need a helper function. If we implemented the algo here, we would have to create a "low" var here to 0 and a "high" var to (array.count-1). When recursively calling the function, the implementation would constantly reset the low value to 0 and the high value to (array.count-1)
         return self._resursiveBinarySearch(array, value: value, low: 0, high: array.count-1)
    }

    fileprivate func _resursiveBinarySearch (_ array: [Int], value: Int, low: Int, high: Int) -> Int? {
        // if the high = low, we have checked every element -> continue check to see if the last element (array[low] or array[high]) is equal to the value we're searching for
        guard low <= high else {return nil}
        let mid = low + ((high-low)/2)
        switch mid {
        case let midPoint where array[midPoint] > value:
            return _resursiveBinarySearch(array, value: value, low: low, high: midPoint-1)
        case let midPoint where array[midPoint] < value:
            return _resursiveBinarySearch(array, value: value, low: midPoint+1, high: high)
        default:
            return mid
        }
    }
    
    
    // generic recursive binary search without helper function. Takes a range which user will define as 0...array.count and continually adjusts the range based on array[index] vs search key. THIS RELIES ON END USER PROVIDING CORRECT RANGE WHICH IS BAD PRACTICE. Defer to above recursive binsearch that calls helped function.
 
    func genericRecursiveBinarySearch<T: Comparable>(_ array: [T], value: T, range: Range<Int>) -> Int? {
        
        guard range.lowerBound <= range.upperBound else {return nil}
        let mid = range.lowerBound + (range.upperBound-range.lowerBound)/2
        if array[mid] > value {
            return genericRecursiveBinarySearch(array, value: value, range: 0..<mid)
        }
        else if array[mid] < value {
            return genericRecursiveBinarySearch(array, value: value, range: mid+1..<range.upperBound)
        }
        else {
            return mid
        }
    }
    
}
