//
//  ContentView.swift
//  gemini XD
//
//  Created by Turma02-18 on 24/09/25.
//

import SwiftUI
import GoogleGenerativeAI

struct ContentView: View {
    
    let model = GenerativeModel(name: "gemini-2.0-flash", apiKey: APIKey.default)
    @State var textInput = ""
    @State var aiResponse = "Hello! How can I help you today?"
    
    var body: some View {
        ZStack{
            Color.babyBlue
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
            }
        VStack{
            ScrollView{
                Text(aiResponse)
                    .frame(width: 300, height: 500)
                    .padding()
                    .border(Color.black)
            }
            HStack{
                TextField("Enter a message", text: $textInput)
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(.black)
                    .frame(width: 300)
                Button(action: sendMessage, label: {
                    Image(systemName: "paperplane.fill")
                })
            }
            Spacer()
        }
    }
}


             func sendMessage () {
            aiResponse = ""
            
            Task{
                do{
                    let response = try await model.generateContent(textInput)
                    
                    guard let text = response.text else{
                        textInput = "Sorry, I could not process that.\nPlease try again."
                        return
                    }
                    
                    textInput = ""
                    aiResponse = text
                    
                } catch {
                    aiResponse = "Something went wrong!\n\(error.localizedDescription)"
                }
            }
        }
    }
             
#Preview {
    ContentView()
}
