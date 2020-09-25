//
//  ViewController.swift
//  TechtaGram
//
//  Created by Tyler Inari on 2020/09/24.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var cameraImageView: UIImageView!
    // 元画像
    var originalImage: UIImage!
    // 画像加工するフィルターの宣言
    var filter: CIFilter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // 撮影するボタンを押した時のメソッド
    @IBAction func takePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // カメラを起動
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        } else {
            print("error")
        }
    }
    // 撮影した画像を保存するためのメソッド
    @IBAction func savePhoto() {
        UIImageWriteToSavedPhotosAlbum(cameraImageView.image!, nil, nil, nil)
    }
    // 表示している画像フィルターを加工する時のメソッド
    @IBAction func colorFilter() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        // フィルターの設定
        filter =  CIFilter(name: "CIColorControls")
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        // 彩度の調整
        filter.setValue(1.0, forKey: "inputSaturation")
        // 明度の調整
        filter.setValue(0.5, forKey: "inputBrightness")
        // コントラストの調整
        filter.setValue(2.5, forKey: "inputContrast")
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage:  cgImage!)
    }
    // カメラロールにある画像を読み込む時のメソッド
    @IBAction func openAlbum() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // カメラロールの画像を選択し画像を表示するまでの一連の流れ
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
    }
    // SNSに投稿用メソッド
    @IBAction func snsPhoto() {
        // 投稿するときに一緒に載せるコメント
        let shareText = "ぴえん"
        // 投稿する画像の選択
        let shareImage = cameraImageView.image!
        //// 投稿するコメントと画像の準備
        let  activityItems: [Any] = [shareText, shareImage]
        let  activityViewContoroller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        let  excludedActivityTypes = [UIActivity.ActivityType.postToWeibo, .saveToCameraRoll, .print]
        activityViewContoroller.excludedActivityTypes = excludedActivityTypes
        present(activityViewContoroller, animated: true, completion: nil)
    }
    // カメラ,カメラロールの画像をアプリに表示させるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        cameraImageView.image = info[.editedImage] as? UIImage
        originalImage = cameraImageView.image
        dismiss(animated: true, completion: nil)
    }

}

