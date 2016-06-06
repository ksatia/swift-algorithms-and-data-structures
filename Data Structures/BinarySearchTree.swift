//
//  BinarySearchTree.swift
//  Data Structures
//
//  Created by Karan Satia on 6/2/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

//rewrite using BSTNode class!

import UIKit

class BinarySearchTree<T: Comparable> {
// The characteristics of a tree that make it a BST are that 1. leftchild.value < parentnode.value and 2. rightchild.value > parentnode.value
// When inserting a node, we must compare the value to the root node. If it's smaller than the root, go left, otherwise go right. Continue this process (recursively) until you can find an empty position where you can place your node. 
// When searching the tree, you do the same thing as insertion. Check root node. If node to search for < root, take left branch, else take right branch. 
// Traversal takes 3 forms - in-order, pre-order, post-order. In-order looks at the left child first, then the parent node, and then at the right child. Pre-order looks at the parent node, then the left and right children. Post-order looks at left and right children and looks at parent node last. 
// In -order looks at nodes from low-high.
// Deletion can be tricky. If the node being deleted has only one child, it's simple. Have the child now point to the parent.parent and just remove the current node (same as a linked list). If there are two children, however, it is more complex. We must replace the node being removed by the child that is larger than the node (in a balanced BST, this would always be the right child).
//    

    var rootNode: BinarySearchTreeNode<T>?
    
    var count: Int {
        guard let root = rootNode else {
            return 0
        }
        return root.count
    }

    convenience init(array:[T]) {
        self.init ()
        precondition(array.count > 0)
        rootNode = BinarySearchTreeNode<T>(value: array.first!)
        for i in array.dropFirst() {
            insert(i)
        }
    }
    
    func insert(value: T) {
        guard rootNode != nil else {
            rootNode = BinarySearchTreeNode<T>(value: value)
            return
        }
        if let root = rootNode {
          insertNode(value, parent: root)
        }
    }
    
    private func insertNode(value: T, parent: BinarySearchTreeNode<T>) {
        //we've already done root nil checking with our guard statement in our earlier insert function
        
        // check to see if we should insert in left subtree
        if value < parent.value {
            if let left = parent.left {
                insertNode(value, parent: left)
            }
                // if no left child, create one and assign value
            else {
                let left = BinarySearchTreeNode<T>(value: value)
                left.parent = parent
                parent.left = left
            }
        }
        else {
            if let right = parent.right {
                insertNode(value, parent: right)
            }
            else {
                let right = BinarySearchTreeNode<T>(value: value)
                right.parent = parent
                parent.right = right
            }
        }
    }
}


extension BinarySearchTree: CustomStringConvertible {
    var description: String {
//        var s = ""
//        if let left = rootNode?.left {
//            s += "((\(left.description)) <- "
//        }
//        s += "\(rootNode?.left!.value)"
//        if let right = rootNode?.right {
//            s += " -> (\(right.description))"
//        }
//        return s
//    }
        if let root = rootNode {
            return root.description
        }
        return ""
    }
}

