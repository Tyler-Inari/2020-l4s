//
//  ViewController.swift
//  When_Who_Game
//
//  Created by Tyler Inari on 2020/09/14.
//  Copyright © 2020 Inari Hotaru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var whenLabel: UILabel!
    @IBOutlet var whereLabel: UILabel!
    @IBOutlet var whoLabel: UILabel!
    @IBOutlet var whatLabel: UILabel!
    
    let whenArray: [String] = ["一年前", "一週間", "昨日", "今日"]
    let whereArray: [String] = ["アメリカで", "海で", "学校で", "クラスで"]
    let whoArray: [String] = ["大統領が", "僕が", "先生が", "友達が"]
    let whatArray: [String] = ["演説した", "叫んだ", "怒った", "踊った"]
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func change() {
        whenLabel.text = whenArray[index]
        whereLabel.text = whereArray[index]
        whoLabel.text = whoArray[index]
        whatLabel.text = whatArray[index]
        
        // indexの値を+1
        index = index + 1
        
        // indexの値が3より大きくなったら0へ
        if index > 3 {
            index = 0
        }
    }
    
    @IBAction func reset() {
        // それぞれのラベルを元に
        whenLabel.text = "---"
        whereLabel.text = "---"
        whoLabel.text = "---"
        whatLabel.text = "---"
        
        index = 0
    }
    
    @IBAction func random() {
        // 乱数を生成しそれぞれのインデックスへ
        let whenIndex = Int.random(in: 0...3)
        let whereIndex = Int.random(in: 0...3)
        let whoIndex = Int.random(in: 0...3)
        let whatIndex = Int.random(in: 0...3)
        
        print("when: \(whenIndex)")
        print("where: \(whereIndex)")
        print("who: \(whoIndex)")
        print("what: \(whatIndex)")
        
        whenLabel.text = whenArray[whenIndex]
        whereLabel.text = whereArray[whereIndex]
        whoLabel.text = whoArray[whoIndex]
        whatLabel.text = whatArray[whatIndex]
    }
}

