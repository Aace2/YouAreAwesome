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
    @State var randomNumber = NumberGenerator()
    @State private var soundIsOn = true
    
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
//                .animation(.default, value: messageString)
                .animation(.easeIn(duration: 0.15), value: messageString)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 30))
                .padding(30)
                .animation(.default, value: messageString)
            
            Spacer()
            
            HStack {
                
                Text("Sound ON:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                    }
                    
                
                Spacer()
                
                Button("Level UP") {
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
                    
                    lastMessageNumber = randomNumber.nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count)
                    messageString = messages[lastMessageNumber]
                    
                    //                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count)
                    
                    lastImageNumber = randomNumber.nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: 16)
                    imageName = "image\(lastImageNumber)"
                    
                    //                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: 16)
                    
                    lastSoundNumber = randomNumber.nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: 8)
                    
                    if soundIsOn {
                        if audioPlayer != nil && audioPlayer.isPlaying {
                            audioPlayer.stop()
                        }
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                    //funk.playSound(soundName: "sound\(soundNumber)")
                    
                    //                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: 8)
                }
                .font(.title2)
                .fontWeight(.heavy)
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .tint(.accentColor)
        }
        .padding()
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
    
//    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
//        var number: Int
//        repeat {
//            number = Int.random(in: 0..<upperBounds)
//        } while number == lastNumber
//        return number
//    }
}


#Preview {
    ContentView()
}
