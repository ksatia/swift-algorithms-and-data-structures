//
//  BinarySearchTreeNode.swift
//  Data Structures
//
//  Created by Karan Satia on 6/6/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class BinarySearchTreeNode<T: Comparable>: NSObject {
    var value: T
    var parent: BinarySearchTreeNode<T>?
    var left: BinarySearchTreeNode<T>?
    var right: BinarySearchTreeNode<T>?
    
    init(value:T) {
        self.value = value
        super.init()
    }
    
    // MARK COMPUTED VARIABLES
    
    var count: Int {
        // resursive computed property using nil coalescing operator
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    var isLeaf:Bool {
        return left == nil && right == nil
    }
    
    var isRoot: Bool {
        return parent == nil
    }

    var isLeftNode: Bool {
        if let parentNode = parent {
            // remember '=' (assignment), '==' (value equality), '===' (identity equality aka reference equality aka mem address eq)
            return parentNode.left === self
        }
        return false
    }
    
    var isRightNode: Bool {
        if let parentNode = parent {
            return parentNode.right === self
        }
        return false
    }

    var hasOnlyLeftNode: Bool {
        return (self.left != nil && self.right == nil)
    }
    
    var hasOnlyRightNode: Bool {
        return (self.right != nil && self.left == nil)
    }
    
    var hasOnlyOneChild: Bool {
        return hasOnlyLeftNode || hasOnlyRightNode
    }
    
    var hasBothChildren: Bool {
        return (self.left != nil && self.right != nil)
    }

    
    // problem when trying to print out description ->  we call this from our customstringconvertible extension on the tree, but for some reason our overridden var description misses a few BST nodes when printing.
    override var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.value))"
        }
        return s
    }
}