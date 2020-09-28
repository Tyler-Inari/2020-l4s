//
//  InputViewController.swift
//  ToDoList4day3
//
//  Created by Tyler Inari on 2020/09/27.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate, UIAdaptivePresentationControllerDelegate {
    @IBOutlet var todoTextField: UITextField!
    // ユーザーデフォルトにアクセス
    var saveData: UserDefaults = UserDefaults.standard
    // 記入したtodoを格納するための配列
    // var todoArray = [String]()
    var todo: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveToDo() {
        // UserDefaultsに書き込み
        // saveData.set(todoTextField.text, forKey: "todo")
        todo = saveData.array(forKey: "todo") as? [String] ?? []
        if let text = todoTextField.text{
            todo.append(text)
        }
        saveData.set(todo, forKey: "todo")
        print("todo", todo)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        todoTextField = nil
    }
    
//    @IBAction func back() {
//        self.dismiss(animated: true, completion: nil)
//    }
    @IBAction func back(sender: AnyObject) {
//        let parentVC = presentingViewController as! ViewController
//        parentVC.update()
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
