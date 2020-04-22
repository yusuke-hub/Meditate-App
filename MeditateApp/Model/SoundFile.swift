//
//  SoundFile.swift
//  MeditateApp
//
//  Created by 川端雄介 on 2020/04/21.
//  Copyright © 2020 Yusuke Kawabata. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var player:AVAudioPlayer?
    
    func playSound(fileName:String,extensionName:String,numberOfRepeat: Int){
        
        // 再生する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        do {
            
            // 効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.numberOfLoops = numberOfRepeat
            player?.play()
        } catch {
            
            print("エラーです!")
        }
    }
    func pauseSound(fileName:String,extensionName:String){

        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        do {
            
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.pause()
        } catch {
            
            print("エラーです!")
        }
    }
}

