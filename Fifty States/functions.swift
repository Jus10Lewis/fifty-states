//
//  functions.swift
//  Rock-Paper-Scissors_Justin
//
//  Created by Justin Lewis on 10/12/18.
//  Copyright © 2018 DevTrain. All rights reserved.
//

import AVFoundation
//import Foundation


///// Plays sound "soundName".mp3
var player:AVAudioPlayer = AVAudioPlayer()
func playSound (_ soundName: String){
    let audioPath = NSString(string: Bundle.main.path(forResource: soundName, ofType: "mp3")!)
    do {
        player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath as String))
    } catch _ {
        //player = nil
    }
    player.play()
}

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}



let synthesizer = AVSpeechSynthesizer()

func speak(string stringToSpeak: String) {
    synthesizer.stopSpeaking(at: .immediate)
    let utterance = AVSpeechUtterance(string: stringToSpeak)
    synthesizer.speak(utterance)
}


