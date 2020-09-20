//
//  ViewController.swift
//  TechPod
//
//  Created by Tyler Inari on 2020/09/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // StoryBoardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //テーブルビューのデータソースメソッドはViewControllerクラスに記載するという設定
        table.dataSource = self
    }
    
    // セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    // ID付きのセルを取得して,セル付属のtextLabelに「テスト」と表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = "テスト"
        return cell!
    }
}

