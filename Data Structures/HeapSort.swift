//
//  HeapSort.swift
//  Data Structures
//
//  Created by Karan Satia on 6/2/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class HeapSort: NSObject {

    
    // heap sort takes an array and builds a heap out of it. A heap is a tree-based structure -> it's a complete binary tree, meaning that all parents have two child nodes.
    // beyond being a complete binary tree, a heap tree maintains that all nods are either greater than or equal to, or less than or equal to each of its children. It's one or the other. If parent nodes are >= children, it's a max heap. If parent nodes are <= children, its a min heap.
    // assume we have a max heap. the next step after converting array to a heap is to traverse the tree & put the first element of the heap into our array. Make another heap out of the remaining elements, so that the largest remaining element is now the root node. Put it in the array, and recreate the heap. Keep going until we have a largest-smallest sorted array (because we had a max heap). 
    // self.heapsort -> self.buildHeap -> self.recreateHeap
}
