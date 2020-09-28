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
    // 記入したtodoを格納するための配列
    var todoArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // todoを記入するための配列
        if saveData.object(forKey: "todo") != nil {
            todoArray = saveData.object(forKey: "todo") as! [String]
        }
        // テーブルビューのデータソースメソッドはViewControllerクラスに書くという設定
        table.dataSource = self
        // テーブルビューのデリゲートメソッドはViewControllerクラスに書くという設定
        table.delegate = self
    }
    
    func update() {
        // todoを記入するための配列
        if saveData.object(forKey: "todo") != nil {
            todoArray = saveData.object(forKey: "todo") as! [String]
        }
        // テーブルビューのデータソースメソッドはViewControllerクラスに書くという設定
        table.dataSource = self
        // テーブルビューのデリゲートメソッドはViewControllerクラスに書くという設定
        table.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 保存した内容の取得
        if saveData.object(forKey: "todo") != nil {
            todoArray = saveData.object(forKey: "todo") as! [String]
        }
//        table.reloadData()
        print("todoArray", todoArray)
    }
    
    // セルの数を設定
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    // ID付きのセルの取得をし,セル付属のtextLabelの表示設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//        cell?.textLabel?.text = todoArray[indexPath.row]
//        return cell!
        
//        let cell: UITableViewCell = UITableViewCell()
//        cell.textLabel!.text = todoArray[indexPath.row]
//        return cell
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = todoArray[indexPath.row]
        return cell
    }
    
    // セルが押された時に呼ばれるメソッド
    func tableView(_ tableView:UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            todoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            saveData.removeObject(forKey: "todo")
            saveData.set(todoArray, forKey: "todo" )
        }
    }
}
