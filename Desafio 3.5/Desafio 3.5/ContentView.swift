//
//  ContentView.swift
//  Desafio 3.5
//
//  Created by Turma02-18 on 12/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var sheetAberto = false
    
    var body: some View {
        ZStack {
           
            NavigationStack{
                VStack{
                    Image("logo hacka")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                    Spacer()
                    
                    
                    
                        NavigationLink (destination: modo1View()){
                            Text("Modo 1")
                        }
                        .padding()
                        .frame(width: 200,height: 70)
                        .background(.pink.opacity(0.8))
                        .cornerRadius(40)
                        .foregroundColor(.darkB)
                        
                        NavigationLink (destination: modo2View(nome: "")){
                            Text("Modo 2")
                        }
                        .padding()
                        .frame(width: 200,height: 70)
                        .background(.pink.opacity(0.8))
                        .cornerRadius(40)
                        .foregroundColor(.darkB)
                        
                        Button ("Modo 3"){
                            sheetAberto.toggle()
                        }
                        .padding()
                        .frame(width: 200,height: 70)
                        .background(.pink.opacity(0.8))
                        .cornerRadius(40)
                        .foregroundColor(.darkB)
                        .sheet(isPresented: $sheetAberto, content: {
                            modo3View()
                        })
                    
                    
                    
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

struct modo1View: View{
    var body: some View{
        ZStack{
            
            VStack{
                Text("Modo 1").font(.title)
                Spacer()
                Rectangle()
                    .frame(width: 250,height: 300)
                    .foregroundColor(.pink)
                    .cornerRadius(40)
                Spacer()
            }
            
            Text(" nome: Leticia \n sobrenome: Videira")
            
        }
    }
}

struct modo2View: View{
    
    @State var nome: String
    
    var body: some View{
        NavigationStack{
            Text("Modo 2")
            Spacer()
            Text("Bem vindo, \(nome)").font(.title)
            TextField ("Digite seu nome", text: $nome)
                .foregroundStyle(.blue)
                .multilineTextAlignment(.center)
            Spacer()
            
            NavigationLink (destination: modo2de2View(nome: nome)){
                Text("Acessar tela")
            }
            .padding()
            .frame(width: 200,height: 70)
            .background(.pink.opacity(0.8))
            .cornerRadius(40)
            .foregroundColor(.darkB)
            Spacer()
        }
    }
}

struct modo2de2View: View{
    @State var nome: String
    var body: some View{
        ZStack{
            
            VStack{
                Text("Modo 2").font(.title)
                Spacer()
                Rectangle()
                    .frame(width: 250,height: 300)
                    .foregroundColor(.pink)
                    .cornerRadius(40)
                Spacer()
            }
            
            Text("Volte \(nome)")
            
        }
    }
}

struct modo3View: View{
    var body: some View{
        ZStack{
            
            VStack{
                Text("Modo 3").font(.title)
                Spacer()
                Rectangle()
                    .frame(width: 250,height: 300)
                    .foregroundColor(.pink)
                    .cornerRadius(40)
                Spacer()
            }
            
            Text(" nome: Leticia \n sobrenome: Videira")
            
        }
    }
}

#Preview {
    ContentView()
}
