//
//  BinarySearch.swift
//  Data Structures
//
//  Created by Karan Satia on 6/1/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class BinarySearch: NSObject {
//get size, find halfway mark (creat function), set the low to 0 and high to count-1. if midway is less than desired number, new low is halfway+1. Find the midway mark here and continue. If midway is more than desired number, new high is halfway-1. find midway mark here adn continue. can do this recursively.
// while max > min
    /*
    # for recursive solution, method should take array, desired value,
    # min range and max range. if desired value is less than guessindex,
    # call method with restructured ranges. You can call method with
    # if....return methodname(parameters)
 */
    
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

}
