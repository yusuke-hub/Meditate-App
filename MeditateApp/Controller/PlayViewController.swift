//
//  PlayViewController.swift
//  MeditateApp
//
//  Created by 川端雄介 on 2020/04/21.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var stopButton: UIButton!
    
    @IBOutlet var minutesLabel: UILabel!
    @IBOutlet var secondsLabel: UILabel!
    
    var count2:Int = 0
    var minute:Int?
    var second:Int?
    var timer = Timer()
    
    var soundFile = SoundFile()
    var withOutMP3 = WithOutMP3()
    
    var tapCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minutesLabel.text = String(count2/60)
        secondsLabel.text = "00 "
        
        // 再生ボタンの設定
        startButton.layer.cornerRadius = 60.0
        startButton.isEnabled = true
        // 停止ボタンの設定
        stopButton.isEnabled = false
        
        
    }
    
    @IBAction func play(_ sender: Any) {
        
        startButton.isEnabled = false
        
        stopButton.isEnabled = true
        
        startTimer()
    }
    
    func startTimer(){
        // 開始を示す短い音声ファイルを１回だけ再生する
        soundFile.playSound(fileName: "harp", extensionName: "mp3")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    @objc func timerUpdate(){
        if count2 != 0{
            count2 = count2 - 1
            minute = count2 / 60
            second = count2 % 60
            minutesLabel.text = String(minute!)
            secondsLabel.text = String(second!)
        }else{
            dismiss(animated: true, completion: nil)
        }
    } 
    
    @IBAction func stop(_ sender: Any) {
        tapCount += 1
        if tapCount == 1{
            soundFile.pauseSound(fileName: "harp", extensionName: "mp3")
            startButton.isEnabled = true
            timer.invalidate()
        }else{
            dismiss(animated: true, completion: nil)
        }
        // 1度停止ボタンを押して、もう1度押した時の処理を記述する
            // 瞑想を終了するかどうか確認するダイアログを表示する
            // はい　→　前の画面に戻る、いいえ → 同じ画面のまま
                // 経過時間分の値を変数で受け取って、前の画面に渡す
        
    }
}
