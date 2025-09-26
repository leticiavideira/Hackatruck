//
//  ContentView.swift
//  Desafio 4
//
//  Created by Turma02-18 on 15/09/25.
//

import SwiftUI

struct ContentView: View {
    
    struct song : Identifiable{
        var id: Int
        var nome: String
        var artista: String
        var imagem: String
    }
    
    var arrayMusicas = [
        song(id: 1, nome: "Good Graces", artista: "Sabrina Carpenter", imagem: "https://i.pinimg.com/736x/64/42/ad/6442adb04b33dc6e6b5434fcb06c8d9f.jpg"),
        song(id: 2, nome: "Vampire", artista: "Olivia Rodrigo", imagem: "https://i.pinimg.com/1200x/f0/a2/c6/f0a2c68cab05d1ba19c64f8c09673688.jpg"),
        song(id: 3, nome: "Into You", artista: "Ariana Grande", imagem: "https://i.pinimg.com/1200x/f5/e5/2f/f5e52fbb45015be58bbb470a908101f6.jpg"),
        song(id: 4, nome: "Manchild", artista: "Sabrina Carpenter", imagem: "https://i.pinimg.com/736x/6c/de/2b/6cde2ba2898dd7eaf22069329e666db5.jpg"),
        song(id: 5, nome: "Casual", artista: "Chappell Roan", imagem: "https://i.pinimg.com/736x/24/4e/90/244e90c509698893b79c5ca248867b74.jpg"),
        song(id: 6, nome: "The First Time", artista: "Damiano David", imagem: "https://i.pinimg.com/736x/cd/39/3b/cd393bb9d84b09063a6daa9ba71589c2.jpg"),
        song(id: 7, nome: "Tears", artista: "Sabrina Carpenter", imagem: "https://i.pinimg.com/736x/6c/de/2b/6cde2ba2898dd7eaf22069329e666db5.jpg"),
        song(id: 8, nome: "Cinnamon Girl", artista: "Lana Del Rey", imagem: "https://i.pinimg.com/1200x/81/07/92/8107928f1aea22b3f90b212525ed46e2.jpg"),
        song(id: 9, nome: "Gabriela", artista: "KATSEYE", imagem: "https://i.pinimg.com/736x/e4/48/a2/e448a2b847369395a0b72580930cae54.jpg"),
        song(id: 10, nome: "Touch", artista: "KATSEYE", imagem: "https://i.pinimg.com/736x/8b/c1/b1/8bc1b19a2241722a5609b8f2dc29b983.jpg")
        ]
    
    @State var i: Int = 0
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue8, Color.black]),
                    startPoint: .top,
                    endPoint: .center
                )
                .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        AsyncImage(url: URL(string: "https://i.pinimg.com/736x/6d/9d/85/6d9d85e8e4095c6af70c03aee1edd89b.jpg")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 200, height: 200)
                        
                        Text("Pop")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        
                        HStack{
                            AsyncImage(url: URL(string: "https://i.pinimg.com/736x/cc/1d/3e/cc1d3e68aa6c482ff77bf322657c0c6d.jpg")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 30, height: 30)
                            
                            Text("user8172893")
                                .foregroundStyle(.white)
                            
                            Spacer()
                        }
                        HStack{
                            VStack{
                                ForEach (arrayMusicas){ i in
                                    VStack{
                                        NavigationLink(destination: segundaPagina(imagem: i.imagem, nome: i.nome, artista: i.artista)){
                                            VStack{
                                                HStack{
                                                    AsyncImage(url: URL(string: i.imagem)) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                    } placeholder: {
                                                        Color.gray
                                                    }
                                                    .frame(width: 70, height: 70)
                                                    
                                                    VStack{
                                                        Text(i.nome)
                                                            .foregroundStyle(.white)
                                                            .frame(maxWidth: .infinity, alignment: .leading)
                                                        Text(i.artista)
                                                            .foregroundStyle(.white)
                                                            .font(.subheadline)
                                                            .frame(maxWidth: .infinity, alignment: .leading)
                                                    }
                                                    Text("...")
                                                        .foregroundStyle(.white)
                                                        .font(.largeTitle)
                                                    Spacer()
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            VStack{
                                
                            }
                        }
                    }
                    Spacer()
                    Text("Recomendados")
                        .font(.title)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal){
                        HStack{
                            VStack{
                                AsyncImage(url: URL(string: "https://i.pinimg.com/736x/d5/7f/86/d57f8626fabdf2ef2f0de39f2b21ad07.jpg")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 200, height: 200)
                                
                                Text("SIS (Soft Is Strong)")
                                    .foregroundStyle(.white)
                                Text("KATSEYE")
                                    .foregroundStyle(.white)
                                    .font(.subheadline)
                            }
                            
                            VStack{
                                AsyncImage(url: URL(string: "https://i.pinimg.com/736x/38/8b/f0/388bf0e2973cc7996f63437235a5a651.jpg")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 200, height: 200)
                                
                                Text("Short n' Sweet (Deluxe)")
                                    .foregroundStyle(.white)
                                Text("Sabrina Carpenter")
                                    .foregroundStyle(.white)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct segundaPagina: View{
    @State var imagem: String
    @State var nome: String
    @State var artista: String
    
    var body: some View{
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue8, Color.black]),
                startPoint: .top,
                endPoint: .center
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                AsyncImage(url: URL(string: imagem)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                .frame(width: 200, height: 200)
                
                Text(nome)
                    .foregroundStyle(.white)
                Text(artista)
                    .foregroundStyle(.white)
                    .font(.subheadline)
                Spacer()
                HStack{
                    Spacer()
                    Image(systemName: "shuffle")
                        .foregroundStyle(.white)
                        .font(.title)
                    Spacer()
                    Image(systemName: "backward.end.fill")
                        .foregroundStyle(.white)
                        .font(.title)
                    Spacer()
                    Image(systemName: "play.fill")
                        .foregroundStyle(.white)
                        .font(.largeTitle)

                    Spacer()
                    Image(systemName: "forward.end.fill")
                        .foregroundStyle(.white)
                        .font(.title)
                    Spacer()
                    Image(systemName: "repeat")
                        .foregroundStyle(.white)
                        .font(.title)
                    Spacer()
                    
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
