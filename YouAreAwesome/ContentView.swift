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
                var imageNumber: Int
                var messageNumber: Int
                
                
                let messages = ["Dream BIG!",
                                "Momentum Brings Clarity",
                                "You Are Limitless",
                                "Create The Future",
                                "Develop A Growth Mindset",
                                "Embrace The Work",
                                "Be Disciplined!",
                                "Be Consistent"
                ]
                
                repeat {
                    messageNumber = Int.random(in: 0..<messages.count)
                } while lastMessageNumber == messageNumber
                
                messageString = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                repeat {
                    imageNumber = Int.random(in: 0...15)
                } while lastImageNumber == imageNumber
                
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                var soundNumber: Int
                
                repeat {
                    soundNumber = Int.random(in: 0...7)
                } while lastSoundNumber == soundNumber
                
                let soundName = "sound\(soundNumber)"
                lastSoundNumber = soundNumber
                
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
            .font(.title2)
            .fontWeight(.heavy)
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
