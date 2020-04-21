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
        soundFile.pauseSound(fileName: "harp", extensionName: "mp3")
        stopButton.isEnabled = false
        
        startButton.isEnabled = true


        
        timer.invalidate()
    }
}
