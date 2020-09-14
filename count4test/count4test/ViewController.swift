//
//  ViewController.swift
//  count4test
//
//  Created by Tyler Inari on 2020/09/14.
//  Copyright © 2020 Inari Hotaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    @IBOutlet var Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plus() {
        number = number + 1
        Label.text = String(number)
    }
    
    @IBAction func minus() {
        number = number - 1
        Label.text = String(number)
    }
    
    @IBAction func clear() {
        number = 0
        Label.text = String(number)
    }
        
}

