//
//  ContentView.swift
//  Desafio 7
//
//  Created by Turma02-18 on 19/09/25.
//

import SwiftUI

struct Arcane: Codable, Hashable {
    let _id: String
    let _rev: String
    let nome: String
    let idade: Int
    let sexo: String
    let origem: String
    let afiliacao: String
    let status: String
    let imagem: String
    let pfp: String
    
}


class ViewModel: ObservableObject{
    @Published var personagens: [Arcane] = []
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/hackaleti") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Arcane].self, from: data)
                DispatchQueue.main.async{
                    self?.personagens = parsed
                }
            }
            
            catch{
                print(error)
            }
        }
        task.resume()
    }
}



struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                AsyncImage(url: URL(string: "https://i.pinimg.com/736x/7a/a4/0d/7aa40dba265fa64442a58a84a974f5f0.jpg")) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .opacity(0.4)
                                        } placeholder: {
                                            Color.black
                                        }
                                        
                
                VStack{
                    Image("Arcane Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                    
                    
                    
                    
                    ScrollView{
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.personagens, id: \._id) { personagem in
                                                        NavigationLink(destination: DetalheView(personagem: personagem)) {
                                                            HStack(spacing: 16) {
                                                                Spacer()
                                                                AsyncImage(url: URL(string: personagem.pfp)) { image in
                                                                    image
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                } placeholder: {
                                                                    ProgressView()
                                                                }
                                                                .frame(width: 60, height: 60)
                                                                .clipShape(Circle())
                                                                
                                                                Text(personagem.nome)
                                                                    .foregroundStyle(.white)
                                                                    .font(.headline)
                                                                    
                                                                
                                                                Spacer()
                                                            }
                                                            .padding()
                                                            .background(Color.white.opacity(0.1))
                                                            .cornerRadius(12)
                                                        }
                                                    }
                                                }
                                                .padding()
                                            }
                                        }
                                    }
                                    .onAppear {
                                        viewModel.fetch()
                                    }
                           
                                   .navigationBarTitleDisplayMode(.inline)
                                }
                            }
                        }

struct DetalheView: View{
    
    let personagem: Arcane
    
    var body: some View{
        ScrollView {
                    VStack() {
                        AsyncImage(url: URL(string: personagem.imagem)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 250)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text(personagem.nome)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Origem: \(personagem.origem)")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Divider().background(Color.white)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Afiliação: \(personagem.afiliacao)")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(" Idade: \(personagem.idade) \n Sexo: \(personagem.sexo) \n Status: \(personagem.status)")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        Spacer()
                    }
                    .padding()
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black, Color.blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.all)
                )
            }
        }


#Preview {
    ContentView()
}


