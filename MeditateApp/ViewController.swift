//
//  ViewController.swift
//  MeditateApp
//
//  Created by 川端雄介 on 2020/04/19.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var appName: UILabel!
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(changeView), userInfo: nil, repeats: false)
    }
    
    @objc func changeView(){
        performSegue(withIdentifier: "next", sender: nil)
    }


}

