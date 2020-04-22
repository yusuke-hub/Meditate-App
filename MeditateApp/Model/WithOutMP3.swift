//
//  WithOutMP3.swift
//  MeditateApp
//
//  Created by 川端雄介 on 2020/04/21.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import Foundation
class WithOutMP3: SoundFile{
    
    override func playSound(fileName: String, extensionName: String,numberOfRepeat: Int) {
        if extensionName == "mp3"{
            print("このファイルは再生できません")
        }
        player?.stop()
        
    }
}
