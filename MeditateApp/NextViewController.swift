 //
//  NextViewController.swift
//  MeditateApp
//
//  Created by 川端雄介 on 2020/04/21.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var timerPicker: UIDatePicker!
    


    
    var timer = Timer()
    var total:Int?
    var minute:Int?
    var section:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.backgroundColor = .white
        
        startButton.layer.cornerRadius = 60.0
        startButton.backgroundColor = .systemBlue
        startButton.isEnabled = true
        stopButton.layer.cornerRadius = 60.0
        stopButton.backgroundColor = .systemBlue
        stopButton.isHidden = true
        stopButton.isEnabled = false
        

    }
    @IBAction func setTimer(_ sender: Any) {
        total = Int(timerPicker.countDownDuration)
        minute = total!/60
        section = total! - minute!*60
        minuteLabel.text = String(minute!)
        sectionLabel.text = String(section!)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        startButton.isHidden = true
        startButton.isEnabled = false
        stopButton.isHidden = false
        stopButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)

        
    }

    @IBAction func stopButton(_ sender: Any) {
        startButton.isHidden = false
        startButton.isEnabled = true
        stopButton.isHidden = true
        stopButton.isEnabled = false
    }
    @objc func countTimer(){
        if total != 0{
            total! -= 1
            minuteLabel.text = String(minute!)
            sectionLabel.text = String(section!)
        }else{
            timer.invalidate()
        }
    }

}
