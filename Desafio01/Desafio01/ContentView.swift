//
//  ContentView.swift
//  Desafio01
//
//  Created by Turma02-18 on 10/09/25.
//

import SwiftUI



struct ContentView: View {
    
   @State var nome: String = ""
   @State var mostraAlerta = false
    
    var body: some View {
        
        ZStack{
            Image ("imagem fundo des 1").opacity(0.6)
            
            VStack{
                Spacer()
                Spacer()
            
                Text("Bem vindo, \(nome)").font(.title)
                
                TextField ("Digite seu nome", text: $nome)
                    .foregroundStyle(.blue)
                    .multilineTextAlignment(.center)
                Spacer()
                Image("gato-Photoroom").resizable().scaledToFit().frame(width: 300)
                Spacer()
                
                Button("Entrar") {
                   mostraAlerta = true
                        
                }
                .alert ("alerta", isPresented: $mostraAlerta) {
                    Button("OK", role: .cancel) { }
                }message: {
                    Text ("vamos comecar")
                }
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
