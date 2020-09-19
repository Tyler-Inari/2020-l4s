//
//  ViewController.swift
//  Stamp
//
//  Created by Tyler Inari on 2020/09/19.
//

import UIKit

class ViewController: UIViewController,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
    
    // スタンプ画像の名前の配列
    var imageNameArray: [String] = ["hana", "hoshi", "onpu", "shitumon"]
    // 選択しているスタンプの番号
    var imageIndex: Int = 0
    // 背景画像の表示
    @IBOutlet var bgImageView: UIImageView!
    //スタンプ画像が入るimageView
    var imageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // タッチ時の座標を取得
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        // もしimageIndexが0でない(スタンプが選択済みの)とき
        if imageIndex != 0 {
            // スタンプサイズの指定
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            // 押されたスタンプの画像を設定
            print(imageNameArray)
            print(imageIndex)
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.image = image
            // タッチされた位置に画像を配置
            imageView.center = CGPoint(x: location.x, y: location.y)
            // 画像を表示
            self.view.addSubview(imageView)
        }
    }
    
    @IBAction func selectedFirst() {
        imageIndex = 1
    }
    
    @IBAction func selectedSecond() {
        imageIndex = 2
    }
    
    @IBAction func selectedThird() {
        imageIndex = 3
    }
    
    @IBAction func selectedFourth() {
        imageIndex = 4
    }
    
    @IBAction func selectBackground() {
        // UIImagePickerControllerのインスタンスを作成
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        // フォトライブラリの使用設定
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        // フォトライブラリを呼び出す
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    // 選択した画像を背景画像に設定
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // imageに選んだ画像を設定
        let image = info[.originalImage] as? UIImage
        // imageを背景に設定
        bgImageView.image = image
        // フォトライブラリを閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save() {
        // スクリーンショットを取得
        let rect:CGRect = CGRect(x: 0, y: 30, width: 320, height: 380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let caputure = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndPDFContext()
        // フォトライブラリに保存
        UIImageWriteToSavedPhotosAlbum(caputure!, nil, nil, nil)
        
    }
    
    @IBAction func back() {
        self.imageView.removeFromSuperview()
    }
}

