//
//  ViewController.swift
//  ToDoList4day3
//
//  Created by Tyler Inari on 2020/09/27.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // TableViewを宣言
    @IBOutlet var table: UITableView!
    // クラスの呼び出し
     var saveData: UserDefaults = UserDefaults.standard
    // テキスト
     var todoText: String!
    // ユーザーデフォルトの読み込み
    
    // 記入したtodoを格納するための配列
    var todoArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // テーブルビューのデータソースメソッドはViewControllerクラスに書くという設定
        table.dataSource = self
        // テーブルビューのデリゲートメソッドはViewControllerクラスに書くという設定
        table.delegate = self
        // todoを記入するための配列
        todoArray.append((saveData.object(forKey: "todo") as? String)!)
        print("todoArray", todoArray)
    }
    
    // セルの数を設定
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    // ID付きのセルの取得をし,セル付属のtextLabelの表示設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = todoArray[indexPath.row]
        return cell!
    }
    
    // セルが押された時に呼ばれるメソッド
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("todoArray", todoArray[indexPath.row])
//    }

    func tableView(_ tableView:UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }

}

