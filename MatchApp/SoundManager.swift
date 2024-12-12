//
//  SoundManager.swift
//  MatchApp
//
//  Created by Daulet Omar on 12.12.2024.
//


import Foundation
import AVFoundation

class SoundManager{
    
    // Static classes - allows us to call the function without having to create a variable of type SoundManager
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        case flip
        case shuffle
        case match
        case nomatch
    }
    
    static func playSound(_ effect:SoundEffect) {
        var soundFileName = ""
        
        switch effect {
        case .flip:
            soundFileName = "cardflip"
            
        case .shuffle:
            soundFileName = "shuffle"
            
        case .match:
            soundFileName = "dingcorrect"
            
        case .nomatch:
            soundFileName = "dingwrong"
            
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Could not find the sound file \(soundFileName) in the bundle.")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        // Create an audio player object
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
        }
        catch{
            print("Could not create an audio player object for sound file \(soundFileName).")
        }
    }
    
    
}
 
