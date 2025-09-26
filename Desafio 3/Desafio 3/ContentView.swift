//
//  ContentView.swift
//  Desafio 3
//
//  Created by Turma02-18 on 12/09/25.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        TabView{
            RosaView()
                .tabItem{
                    Label("Rosa", systemImage: "paintbrush.fill")
                }
                .toolbarBackground(.visible, for: .tabBar)
            
            
            BlueView()
                .tabItem{
                    Label("Azul", systemImage: "paintbrush.pointed.fill")
                }
                .toolbarBackground(.visible, for: .tabBar)
            
            
            GrayView()
                .tabItem{
                    Label("Cinza", systemImage: "paintpalette.fill")
                }
                .toolbarBackground(.visible, for: .tabBar)
            
            
            ListView()
                .tabItem{
                    Label("Lista", systemImage: "list.bullet.clipboard.fill")
                }
                .toolbarBackground(.visible, for: .tabBar)
        }
    }
}
struct RosaView: View{
    var body: some View{
        ZStack{
            Color.pink
                .padding()
            Circle()
                .frame(height: 250)
                .foregroundColor(.white)
            Image(systemName: "paintbrush")
                .foregroundColor(.pink)
                .font(.system(size: 150))
        }
    }
}
struct BlueView: View{
    var body: some View{
        ZStack{
            Color.blue
                .padding()
            Circle()
                .frame(height: 250)
                .foregroundColor(.white)
            Image(systemName: "paintbrush.pointed")
                .foregroundColor(.blue)
                .font(.system(size: 150))
        }
    }
}
struct GrayView: View{
    var body: some View{
        ZStack{
            Color.gray
                .padding()
            Circle()
                .frame(height: 250)
                .foregroundColor(.white)
            Image(systemName: "paintpalette")
                .foregroundColor(.gray)
                .font(.system(size: 150))
        }
    }
}
struct ListView: View{
    
    var body: some View{
        VStack{
            Text("Lista").font(.title)
            List{
                HStack{
                    Text("Rosa")
                    Spacer()
                    Image(systemName: "paintbrush")
                }
                HStack{
                    Text("Azul")
                    Spacer()
                    Image(systemName: "paintbrush.pointed")
                }
                HStack{
                    Text("Cinza")
                    Spacer()
                    Image(systemName: "paintpalette")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
