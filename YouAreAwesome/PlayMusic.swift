//
//  PlayMusic.swift
//  YouAreAwesome
//
//  Created by TheForce on 9/22/24.
//

import Foundation
import SwiftUI
import AVFAudio

struct PlayMusic {
    func playSound(soundName: String) {
        var audioPlayer: AVAudioPlayer!
        
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audio player")
        }
    }
}
