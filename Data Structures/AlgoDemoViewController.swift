//
//  AlgoDemoViewController.swift
//  Data Structures
//
//  Created by Karan Satia on 5/31/16.
//  Copyright © 2016 Karan Satia. All rights reserved.
//

import UIKit

var sorter = SelectionSort()


class AlgoDemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectionSort()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func selectionSort () {
        var unsortedArray = [3, 6, 1, 25, 300, 2, 10]
        print(sorter.selectionSort(&unsortedArray))
    }

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
