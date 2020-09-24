//
//  ResultViewController.swift
//  Quiz
//
//  Created by Tyler Inari on 2020/09/24.
//

import UIKit

class ResultViewController: UIViewController {
    // 正解数
    var correctAnswer: Int = 0
    // 結果を表示するラベル
    @IBOutlet var resultLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = String(correctAnswer)
    }
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true, completion: nil)
    }

}
