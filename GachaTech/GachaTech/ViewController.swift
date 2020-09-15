//
//  ViewController.swift
//  GachaTech
//
//  Created by Tyler Inari on 2020/09/13.
//  Copyright © 2020 Inari Hotaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var gachaLabel: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // gachaLabel.layer.cornerRadius = 10
    }
    
    @IBAction func gacha() {
        self.performSegue(withIdentifier: "result", sender: nil)
    }
}

