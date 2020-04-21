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
    
    @IBOutlet var startButton: UIButton!
    
    var count:Int?
    
    var timer = Timer()
    var total:Int?
    var minute:Int?
    var section:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.backgroundColor = .white

        startButton.layer.cornerRadius = 60.0
        startButton.backgroundColor = .lightGray


    }
    @IBAction func setTimer(_ sender: Any) {
        
        count = Int(timerPicker.countDownDuration)

    }
    
    @IBAction func start(_ sender: Any) {
        performSegue(withIdentifier: "play", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playVC = segue.destination as! PlayViewController
        if count != nil{
            playVC.count2 = count!
        }else{
            playVC.count2 = 600
        }
    }

}
