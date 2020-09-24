//
//  ViewController.swift
//  CocoaPodsApp
//
//  Created by Tyler Inari on 2020/09/24.
//

import UIKit
import PKHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        HUD.flash(.success, delay: 2.0)
    }
}

