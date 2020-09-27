//
//  InputViewController.swift
//  ToDoList4day3
//
//  Created by Tyler Inari on 2020/09/27.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var todoTextField: UITextField!
    
    // ユーザーデフォルトにアクセス
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // UserDefaultsから読み込み
        todoTextField.text = saveData.object(forKey: "todo") as? String
        todoTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveToDo() {
        // UserDefaultsに書き込み
        saveData.set(todoTextField.text, forKey: "todo")
        print("saveData", saveData)
        print(todoTextField.text)
        // アラート
        let alert: UIAlertController = UIAlertController(title: "todo", message: "リストを更新します。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        // ボタンが押された時の動作
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
