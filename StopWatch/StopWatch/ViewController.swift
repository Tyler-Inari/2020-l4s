//
//  ViewController.swift
//  StopWatch
//
//  Created by Tyler Inari on 2020/09/14.
//  Copyright © 2020 Inari Hotaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up() {
        // countを0.01足す
        count = count + 0.01
        // ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start() {
        
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
    }
    
    @IBAction func stop() {
        if timer.isValid {
            // タイマーが動作していたら停止
            timer.invalidate()
        }
        
    }
}

