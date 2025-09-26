//
//  ContentView.swift
//  ml
//
//  Created by Turma02-18 on 23/09/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var classifier = ImageClassifier()
    @State private var uiImage: UIImage?
    
    var body: some View {
        ZStack{
            Color.babyBlue
                .ignoresSafeArea()
            VStack{
                Text("Image Classification")
                    .font(.title)
                    .foregroundStyle(.dBlue)
                    .bold()
                    .padding()
                    .clipShape(.capsule)
                    .background(.babyPink)
                    .cornerRadius(35)
                Spacer()
                
                Image ("cat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
            }
            VStack{
                    Spacer()
                if let uiImage = uiImage {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 250)
                                        .padding()
                                        .background(.dBlue)
                                        .cornerRadius(15)

                                    Text(classifier.classification)
                                        .font(.headline)
                                        .foregroundStyle(.dBlue)
                                        //.background()
                                        .frame(width: 225)
                                        .padding()
                                } else {
                                    ProgressView("Carregando imagem...")
                                }
                                Spacer()
                                Spacer()
                            }
                        }
                        .onAppear {
                            loadImage(from: "https://picsum.photos/300/300") // ✅ Coloque a URL da imagem aqui
                        }
                    }

                    // Função para carregar imagem da URL
                    func loadImage(from urlString: String) {
                        guard let url = URL(string: urlString) else { return }

                        URLSession.shared.dataTask(with: url) { data, _, _ in
                            if let data = data, let image = UIImage(data: data) {
                                DispatchQueue.main.async {
                                    self.uiImage = image
                                    classifier.classify(image: image)
                                }
                            }
                        }.resume()
                    }
                }


#Preview {
    ContentView()
}
