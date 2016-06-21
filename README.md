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


[Linked List]: https://github.com/ksatia/swift-ds/blob/master/Data%20Structures/LinkedList.swift
[Stack]: https://github.com/ksatia/swift-ds/blob/master/Data%20Structures/Stack.swift
[Queue]: https://github.com/ksatia/swift-ds/blob/master/Data%20Structures/Queue.swift 
