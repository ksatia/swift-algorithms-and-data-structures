//
//  LinkedListNode.swift
//  Data Structures
//
//  Created by Karan Satia on 5/24/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

class LinkedListNode <T> {
    var value: T
    var next: LinkedListNode?
    var prev: LinkedListNode?
    
    init (value:T ) {
        self.value = value
    }
}

