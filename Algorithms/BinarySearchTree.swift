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
    
    
    func searchForValue(value:T) -> BinarySearchTreeNode<T>? {
        guard rootNode != nil else {
            return nil
        }
            return searchTreeForValue(value, parent: rootNode!)
    }
    
    
    func searchTreeForValue(value:T, parent: BinarySearchTreeNode<T>) -> BinarySearchTreeNode<T>? {
        if value < parent.value {
            if let left = parent.left {
            return searchTreeForValue(value, parent: left)
            }
        }
        else if value > parent.value {
            if let right = parent.right {
                return searchTreeForValue(value, parent: right)
            }
        }
        return parent
    }
    
    
    func maximum () -> BinarySearchTreeNode<T> {
        var parent = rootNode
        while case let next? = parent!.right {
            parent = next
            }
        return parent!
    }
    
    
    func minimum (subTreeRoot: BinarySearchTreeNode<T>) -> BinarySearchTreeNode<T> {
        var parent = subTreeRoot
        while case let next? = parent.left {
            parent = next
        }
        return parent
    }
    

    func deleteNode(value:T) {
        //retrieve node by reference using search function
        if let deletedNode = self.searchForValue(value) {
            //if our node to delete has both kids
            if deletedNode.hasBothChildren {
                deleteNodeWithTwoChildren(deletedNode)
            }
                //if our node to delete has one kid
            else if deletedNode.hasOnlyOneChild {
                deleteNodeWithOneChild(deletedNode)
            }
                //our node is a leaf node
            else {
                deleteLeafNode(deletedNode)
            }
        }
    }
    

    func deleteNodeWithTwoChildren (node:BinarySearchTreeNode<T>?) {
        //let's use far left node in right subtree (node.right.minimum). We must replace the node to delete with that one, reconnect pointers and deallocate deleted node.
        let replacement = minimum(node!.right!)
        var og = node
        let replacementParent = replacement.parent
        // if the min node is a right node, the parent must now have a nil right child
        if replacement.isRightNode {
            replacementParent?.right = nil
        }
            // if the min node is a left node, the parent must now have a nil left child
        else if replacement.isLeftNode {
            replacementParent?.left = nil
        }
        
        //detatch the min node from parent
        replacement.parent = nil
        
        if let orig = og {
            //if we are deleting the root
            if orig.parent == nil {
                rootNode = replacement
            }
                //if we are deleting a left node
            else if orig.isLeftNode {
                let parent = orig.parent
                parent?.left = replacement
                replacement.parent = parent
            }
                //if we are deleting a right node
            else {
                let parent = orig.parent
                parent?.right = replacement
                replacement.parent = parent
            }
            // original node always has two children, so we must connect both to the replacement
            replacement.right = orig.right
            replacement.left = orig.left
            orig.right?.parent = replacement
            orig.left?.parent = replacement
        }
        og = nil
    }
    
    
    func deleteNodeWithOneChild (node: BinarySearchTreeNode<T>?) {
        var deletedNode = node
            guard let parent = deletedNode!.parent else {
                //we are dealing with the root node in a single node tree
                if deletedNode!.hasOnlyLeftNode {
                    rootNode = deletedNode!.left
                }
                else {
                    rootNode = deletedNode!.right
                }
                //nullify the rootNode parent and set node we deleted (rootNode) to nil
                rootNode?.parent = nil
                deletedNode = nil
                return
            }
            
            //outside of the guard statement here, we aren't dealing with root node
            //if the deleted node is a right node, we will be replacing the parents right node position
            if deletedNode!.isRightNode {
                if deletedNode!.hasOnlyRightNode {
                parent.right = deletedNode!.right
                }
                else {
                    parent.right = deletedNode!.left
                }
            }
            //if the deleted node is a left node, we will be replacing the parents left node position
            else {
                if deletedNode!.hasOnlyLeftNode {
                    parent.left = deletedNode!.left
                }
                else {
                    parent.left = deletedNode!.right
                }
            }
        }
    
    
    func deleteLeafNode(node: BinarySearchTreeNode<T>?) {
        var deletedNode = node
        guard let parent = deletedNode!.parent else {
            //we have a root node and are removing it
            rootNode = nil
            return
        }
        //if the deleted node is a left child
        if deletedNode!.isLeftNode {
            parent.left = nil
        }
        else {
            parent.right = nil
        }
        deletedNode = nil
    }
}


extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        if let root = rootNode {
            return root.description
        }
        return ""
    }
}

