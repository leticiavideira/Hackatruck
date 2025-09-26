//
//  ContentView.swift
//  text into speech
//
//  Created by Turma02-18 on 23/09/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
   
    
    @State var utterance = AVSpeechUtterance()
    let synthesizer = AVSpeechSynthesizer()
    @State var text: String = ""
    
    var body: some View {
        Form {
            Section{
                TextField("Type here", text: $text)
            } header: {
                Text("text to be synthesized")
            }
            Button ("synthesized", systemImage: "microphone.fill"){
                utterance = AVSpeechUtterance(string: text)
                utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                synthesizer.speak(utterance)
            }
            
        }
    }
}

#Preview {
    ContentView()
}

