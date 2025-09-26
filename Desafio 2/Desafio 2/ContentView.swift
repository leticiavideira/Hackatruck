//
//  ContentView.swift
//  Desafio 2
//
//  Created by Turma02-18 on 11/09/25.
//

import SwiftUI

struct ContentView: View {
    @State var distancia: Float = 0.0
    @State var tempo: Float = 0.0
    @State var velocidade: Float = 0.0
    @State var cor: Color = .gray
    
    var body: some View {
        
        
        ZStack{
            
            cor
                .ignoresSafeArea()
            
            VStack{
                Text ("Digite a distância (Km): ")
                TextField("Km", value: $distancia, format: .number)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(50)
                    .frame(width: 200)
                
                Text ("Digite o tempo (h): ")
                TextField("h", value: $tempo, format: .number)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(50)
                    .frame(width: 200)
                
                Button("Calcular") {
                    
                    velocidade = distancia / tempo
                    
                    if tempo == 0{
                        velocidade = 0
                        
                    }
                    
                    switch velocidade {
                            case ..<1:
                                cor = Color.verdeCamarao // cor para camarão
                            case 1..<3:
                                cor = Color.laranjaTartaruga // cor para tartaruga
                            case 3..<15:
                                cor = Color.verdeLontra// cor para lontra
                            case 15..<55:
                                cor = Color.azulFoca // cor para foca
                            case 55...100:
                                cor = Color.amareloTubarao // cor para tubarão
                            default:
                                cor = Color.gray
                            }
                       
                }
                .padding()
                .clipShape(.capsule)
                .background(.white.opacity(0.5))
                .cornerRadius(50)
                .foregroundColor(.black)
                
                
                Spacer()
                Text (String(format: "%.2f Km/h", velocidade)).font(.title)
                Spacer()
                
                if velocidade == 0{
                    Image("interrogacao")
                    
                } else if velocidade < 1 {
                    Image("camarão")
                        .resizable()
                        .scaledToFit()
                    
                } else if velocidade < 3 {
                    Image("tartaruga")
                        .resizable()
                        .scaledToFit()
                    
                } else if velocidade < 15 {
                    Image("lontra")
                        .resizable()
                        .scaledToFit()
                    
                    
                } else if velocidade < 55 {
                    Image("foca")
                        .resizable()
                        .scaledToFit()
                    
                } else if velocidade <= 100 {
                    Image("tubarão")
                        .resizable()
                        .scaledToFit()
                }
                
                
                ZStack{
                    
                Rectangle()
                    .frame(width: 250, height: 200)
                    .cornerRadius(30)
                    .foregroundStyle(.white.opacity(0.5))
                
                    VStack{
                        HStack{
                            Text("Camarão (0 - 0.9 km/h)")
                            Circle()
                                .frame(width: 20)
                                .foregroundColor(.verdeCamarao)
                        }
                        HStack{
                            Text("Tartaruga (1 - 2.9 km/h)")
                            Circle()
                                .frame(width: 20)
                                .foregroundColor(.laranjaTartaruga)
                        }
                        HStack{
                            Text("Lontra (3 - 14.9 km/h)")
                            Circle()
                                .frame(width: 20)
                                .foregroundColor(.verdeLontra)
                        }
                        HStack{
                            Text("Foca (15 - 54.9 km/h)")
                            Circle()
                                .frame(width: 20)
                                .foregroundColor(.azulFoca)
                        }
                        HStack{
                            Text("Tubarão (55 - 100 km/h)")
                            Circle()
                                .frame(width: 20)
                                .foregroundColor(.amareloTubarao)
                        }
                        
                    }
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
