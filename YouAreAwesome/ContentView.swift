//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by TheForce on 9/18/24.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var funk = PlayMusic()
    
    var body: some View {
        VStack {
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundStyle(.red)
                .padding()
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 30))
                .padding(30)
            
            Spacer()
            
            Button("Motivate") {
                let messages = [
                    "Dream BIG!",
                    "Momentum Brings Clarity",
                    "You Are Limitless",
                    "Create The Future",
                    "Develop A Growth Mindset",
                    "Embrace The Work",
                    "Be Disciplined!",
                    "Be Consistent"
                ]
                
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count)
                messageString = messages[lastMessageNumber]
                
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: 16)
                imageName = "image\(lastImageNumber)"
                
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: 8)
                playSound(soundName: "sound\(lastSoundNumber)")
                //funk.playSound(soundName: "sound\(soundNumber)")
            }
            .font(.title2)
            .fontWeight(.heavy)
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
    
    func playSound(soundName: String) {
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
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var number: Int
        repeat {
            number = Int.random(in: 0..<upperBounds)
        } while number == lastNumber
        return number
    }
}


#Preview {
    ContentView()
}
