//
//  ViewController.swift
//  TechPod
//
//  Created by Tyler Inari on 2020/09/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    // StoryBoardで扱うTableViewを宣言
    @IBOutlet var table: UITableView!
    
    // 曲名を入れるための配列
    var songNameArray = [String]()
    // 曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    // ジャケ写
    var imageNameArray = [String]()
    //音楽の再生
    var audioPlayer : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // テーブルビューのデータソースメソッドはViewControllerクラスに記載するという設定
        table.dataSource = self
        
        // テーブルビューのデリゲートメソッドはViewControllerメソッドに記載するという設定
        table.delegate = self
        
        // songNameArrayに曲名を格納
        songNameArray = ["ナンバーナイン", "nighthawks", "砂の惑星", "雨の街路に夜光蟲"]
        // fileNameArrayにファイル名を格納
        fileNameArray = ["ナンバーナイン", "Nighthawks", "砂の惑星", "雨の街路に夜光蟲"]
        // imageNameArrayに曲の画像を格納
        imageNameArray = ["icon.png", "icon.png", "icon.png", "icon.png"]
        
    }
    
    // セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // セルの数をsongNameArrayの数と定義
        return songNameArray.count
    }
    // ID付きのセルを取得して,セル付属のtextLabelに「テスト」と表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        // セルにsongNameArrayの曲名を表示
        cell?.textLabel?.text = songNameArray[indexPath.row]
        // セルに画像を表示
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell!
    }
    
    // セルが押された時に呼ばれるメソッド
    func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("\(songNameArray[indexPath.row]) was selected")
        // 音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "m4a")!)
        // 再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        // 音楽を再生
        audioPlayer.play()
    }
}

