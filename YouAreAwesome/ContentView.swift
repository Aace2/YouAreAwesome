//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by TheForce on 9/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    
    var body: some View {
        
        VStack {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 30))
                .padding(30)
            
            Spacer()
            
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
            
            Spacer()
            
            Button("Motivate") {
                let messages = ["Dream BIG!",
                                "Momentum Brings Clarity",
                                "You Are Limitless",
                                "Create The Future",
                                "Develop A Growth Mindset",
                                "Embrace The Work",
                                "Be Disciplined",
                                "Be Consistent"
                ]
                
                messageString = messages[messageNumber]
                messageNumber += 1
                messageNumber = messageNumber == messages.count ? 0 : messageNumber
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                imageNumber = imageNumber > 15 ? 0 : imageNumber
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
