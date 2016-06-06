//
//  NodelessBST.swift
//  Data Structures
//
//  Created by Karan Satia on 6/6/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

// here we implement a generic BST without using an assisting node data structure. Technically, every node is just a subtree (a single node tree, in the case of an individual node) and so can be represented as a tree instead of a node.
import UIKit

class NodelessBST<T: Comparable> {
    // The characteristics of a tree that make it a BST are that 1. leftchild.value < parentnode.value and 2. rightchild.value > parentnode.value
    // When inserting a node, we must compare the value to the root node. If it's smaller than the root, go left, otherwise go right. Continue this process (recursively) until you can find an empty position where you can place your node.
    // When searching the tree, you do the same thing as insertion. Check root node. If node to search for < root, take left branch, else take right branch.
    // Traversal takes 3 forms - in-order, pre-order, post-order. In-order looks at the left child first, then the parent node, and then at the right child. Pre-order looks at the parent node, then the left and right children. Post-order looks at left and right children and looks at parent node last.
    // In -order looks at nodes from low-high.
    // Deletion can be tricky. If the node being deleted has only one child, it's simple. Have the child now point to the parent.parent and just remove the current node (same as a linked list). If there are two children, however, it is more complex. We must replace the node being removed by the child that is larger than the node (in a balanced BST, this would always be the right child).
    
    var value: T
    var parent: NodelessBST?
    var left: NodelessBST?
    var right: NodelessBST?
    
    init(value: T) {
        self.value = value
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    var isLeftChild: Bool {
        if let parentNode = parent {
            // === is a reference equality operator. It checks to see if the two objects on either side share the same memory address
            return parentNode.left === self
        }
        return false
    }
    
    var isRightChild: Bool {
        if let parentNode = parent {
            // === is a reference equality operator. It checks to see if the two objects on either side share the same memory address
            return parentNode.right === self
        }
        return false
    }
    
    var hasLeftChild: Bool {
        return left != nil
    }
    
    var hasRightChild: Bool {
        return right != nil
    }
    
    var hasAnyChild: Bool {
        return hasRightChild || hasLeftChild
    }
    
    var hasBothChildren: Bool {
        return hasRightChild && hasLeftChild
    }
    
    var count: Int {
        // ?? is a nil coalescing operator - if left.count is nil, default the value to 0. This is a recursive computed property.
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    
    convenience init(array:[T]) {
        precondition(array.count>0)
        // take an array, init a binary search tree with the first element so that it is the root
        self.init(value:array.first!)
        // for every other element in the array, excluding the first, call our recursive insert function
        for v in array.dropFirst() {
            insert(v, parent: self)
        }
    }
    
    
    
    func insert(value: T) {
        insert(value, parent: self)
    }
    
    private func insert (value: T, parent: NodelessBST) {
        // if the value we're inserting is less than our root node, we check the left child to see if it exists. If it does exist, we recursively call our fuction and pass in the left node as the parent.
        if value < self.value {
            if let left = left {
                left.insert(value, parent: left)
            }
                // if there is no left child, we create a new "binarysearchtree" which is really just a node. We give it the value passed into our insert function and set the parent to be the most recent parent node traversed over (in the immediately previous recursive call).
            else {
                left = NodelessBST(value: value)
                left?.parent = parent
            }
        }
            // if the value is greater than the root node, check the right child. If it exists, recursively call our function passing in the right node as the parent until we find the propert insertion point.
        else {
            if let right = right {
                right.insert(value, parent: right)
            }
                // if the right child doesn't exist, create a new node, give it the value passed to our function, and set the parent to be the parent most recently passed to our recursive function call.
            else {
                right = NodelessBST(value: value)
                right?.parent = parent
            }
        }
    }
}

extension NodelessBST: CustomStringConvertible {
    var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}
