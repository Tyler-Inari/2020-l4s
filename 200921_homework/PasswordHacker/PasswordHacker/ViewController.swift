//
//  ViewController.swift
//  PasswordHacker
//
//  Created by Tyler Inari on 2020/09/14.
//  Copyright © 2020 Inari Hotaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // UILabelの変数宣言
    @IBOutlet var resultLabel1: UILabel!
    @IBOutlet var resultLabel2: UILabel!
    @IBOutlet var resultLabel3: UILabel!
    @IBOutlet var resultLabel4: UILabel!
        
    
    // カウント表示用ラベル
    @IBOutlet var countLabel: UILabel!
    
    // パスワード
    var password: Int = 1234
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func start() {
        for i in 0...9999 {
            // 解析中の数字を表示
            countLabel.text = String(i)
            // 処理を0.0005秒,待機
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))
            
            if i == password {
                print("correct number is \(i)!!!")
                // passwordの桁ごとの数字を入れる配列
                var digits = [Int]()
                
                for _ in 0...3 {
                    // 1の位を格納
                    digits.append(password % 10)
                    // 桁を1つ下げる
                    password = password / 10
                }
                resultLabel1.text = String(digits[0])
                resultLabel2.text = String(digits[1])
                resultLabel3.text = String(digits[2])
                resultLabel4.text = String(digits[3])
            }
        }
        
    }
    
    @IBAction func reset() {
        password = 1234
        // countLabelの初期化
        countLabel.text = "PUSH 「START」to Analyze"
        
        // ラベルの表示を元に
        resultLabel1.text = "0"
        resultLabel2.text = "0"
        resultLabel3.text = "0"
        resultLabel4.text = "0"
    }

}
