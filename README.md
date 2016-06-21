Algorithms & Data Structures in Swift
------
Here are some implementations of well-known algorithms and data structures in Swift 2.0! Update for 3.0 coming soon. The goal of this project isn't to provide production-ready code (you would seldom need to roll your own merge sort), but is rather an exercise in learning the idioms and syntax of the Swift programming language. All code is compatible with Xcode 7.3 and Swift 2.2. More algos to come1

Back to Basics
------
The best place to start here would be my implementation of a [Linked List]. 
My implementation of a [Queue] and a [Stack] both use the Linked List under the hood.

Algorithms
------
Until I add more, most of the algorithms included here are basic sorts and searches. Some feature both recursive and iterative solutions.

####Sort
1. Insertion Sort
2. Selection Sort
3. Heap Sort

####Search
1. Binary Search (resursive & non-recursive)
2. Binary Search Tree (utilizes recursion wherever possible) - includes both nodeless and a noded solution. The nodeless solution treats each tree node as its own tree, whereas the noded solution uses a node structure to build out an entire tree. *The logic is very different between the two, so be sure to look at both solutions.*

Swifty Notes
------
I make use of generics in my data structures - Swift encourages use of generics, so as long as you specify the data type when instantiating a data structure in a file, my structures will provide support for that type.

*Additionally, I make use of a few swifty things*:

1. Computed Properties - Swift has a nice feature that lets you declare a class property and treat it as a function (I used this in this project for returning Boolean values). Imagine declaring a var isEmpty and having it tell you whether or not a tree is empty or contains nodes. Easy.

2. Extensions - Swift loves extending functionality of classes with extensions. By having classes extend *CustomStringConvertible*, I can override a description variable and provide my own functionality for a print method. I make good use of this in my BST (both versions), where I recursively print the value of tree nodes and have arrows and parenthesis printed to show you the actual tree structure (output code can be found by making the [AlgoDemoViewController] the root VC and running the binary tree function). 

3. Preconditions - Inside of my BST convenience initializers, you can see that it allows for an array to be passed in when initializing. Instead of constantly initializing an empty BST and calling the *insert* function for each object you want to add, you can pass an array during initialization. This initializes a node with the first value, sets it as the root node, and then calls *insert* on remaining array values. Insert then takes each of those values, creates a node from them, and inserts them according to BST rules.

4. Subscript - In my [Linked List], I add functionality for direct access through indexing. I also allow for both getting and setting values at a certain subscript. In the set portion of the subscripting function, I simply call replaceItem and pass it the subscript and a value. 

5. SequenceType - This extension allows us to traverse collections (I implemented it only for a [Linked List]). It makes use of a defer statement and allows you to traverse using: for item in list {}


[Linked List]: https://github.com/ksatia/swift-ds/blob/master/Data%20Structures/LinkedList.swift
[Stack]: https://github.com/ksatia/swift-ds/blob/master/Data%20Structures/Stack.swift
[Queue]: https://github.com/ksatia/swift-ds/blob/master/Data%20Structures/Queue.swift 
[AlgoDemoViewController]: https://github.com/ksatia/swift-ds/blob/master/AlgoDemoViewController.swift
