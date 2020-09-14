//
//  ViewController.swift
//  Count
//
//  Created by Tyler Inari on 2020/09/05.
//  Copyright © 2020 Inari Hotaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Float = 0
    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plus() {
        number = number + 1
        label.text = String(number)
        
        if number >= 10{
            label.textColor = UIColor.red
        } else {
            label.textColor = UIColor.yellow
        }
    }
    
    @IBAction func minus() {
        number = number - 1
        label.text = String(number)
        
        if number <= -10{
            label.textColor = UIColor.green
        } else {
            label.textColor = UIColor.yellow
        }
    }
    
    @IBAction func time() {
        number = number * number
        label.text = String(number)
    }
    
    @IBAction func divide() {
        number = number / number
        label.text = String(number)
    }

}

