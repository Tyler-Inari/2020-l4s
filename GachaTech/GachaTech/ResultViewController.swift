//
//  ResultViewController.swift
//  GachaTech
//
//  Created by Tyler Inari on 2020/09/13.
//  Copyright © 2020 Inari Hotaru. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    // 乱数を入れるためのInt型の変数を用意
    var number: Int!
    
    // 一番後ろの背景画像
    @IBOutlet var bgImageView: UIImageView!
    // モンスターを表示する画像
    @IBOutlet var monsterImageView: UIImageView!
    // モンスターの画像を保存しておく配列
    var monsterArray: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // 0~9の間でランダムに数字を発生
        number = Int.random(in: 0..<10)
        
        if number == 9 {
            monsterImageView.image = UIImage(named: "monster010")
            bgImageView.image = UIImage(named: "bg_gold.png")
        } else if number > 6 {
            monsterImageView.image = UIImage(named: "monster006")
            bgImageView.image = UIImage(named: "bg_red.png")
        } else {
            monsterImageView.image = UIImage(named: "monster003")
            bgImageView.image = UIImage(named: "bg_blue.png")
        }
        
        // モンスターの画像を10枚追加
        monsterArray = [UIImage(named: "monster001.png")!,
                        UIImage(named: "monster002.png")!,
                        UIImage(named: "monster003.png")!,
                        UIImage(named: "monster004.png")!,
                        UIImage(named: "monster005.png")!,
                        UIImage(named: "monster006.png")!,
                        UIImage(named: "monster007.png")!,
                        UIImage(named: "monster008.png")!,
                        UIImage(named: "monster009.png")!,
                        UIImage(named: "monster010.png")!,]
        
        // ランダムに選んだモンスターを表示
        monsterImageView.image = monsterArray[number]
        // Do any additional setup after loading the view.
    }
    
    // ResultVuewControllerが表示されるたびに呼び出すメソッド
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // アニメーションの中でもtransformさせるキーパスを設定
        let animation = CABasicAnimation(keyPath: "transform")
        
        // アニメーションの開始時の数値
        animation.fromValue = NSNumber(value: 0)
        
        // アニメーション終了時の数値
        animation.toValue = NSNumber(value: 2 * Double.pi)
        
        // z軸を中心としたアニメーション
        animation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        
        // アニメーションの早さを指定
        animation.duration = 5
        
        // アニメーションのリピート回数を指定
        animation.repeatCount = Float.infinity
        
        // どのレイヤーをアニメーション表示させるか指定
        bgImageView.layer.add(animation, forKey: nil)
        
    }
    // ResultViewControllerを閉じて前の画面に
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
