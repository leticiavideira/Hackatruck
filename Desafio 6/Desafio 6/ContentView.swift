//
//  ContentView.swift
//  Desafio 6
//
//  Created by Turma02-18 on 17/09/25.
//

import SwiftUI

struct Result: Decodable{
//    var status: String?
    var data: [VaAg]
}

struct VaAg: Decodable {
    let uuid: String?
    let displayName: String
    let description: String
    let developerName: String?
    let releaseDate: String?
    let characterTags: [String]?
    let displayIcon: String
    let displayIconSmall: String?
    let bustPortrait: String?
    let fullPortrait: String?
    let fullPortraitV2: String?
    let killfeedPortrait: String?
    let minimapPortrait: String?
    let homeScreenPromoTileImage: String?
    let background: String?
    let backgroundGradientColors: [String]?
    let assetPath: String?
    let isFullPortraitRightFacing: Bool?
    let isPlayableCharacter: Bool?
    let isAvailableForTest: Bool?
    let isBaseContent: Bool?
    let role: Role1
//    let recruitmentData: RecruitmentData1?
    let abilities: [Abilities1]?
    let voiceLine: String?
    
}
struct Role1: Codable, Hashable{
    let uuid: String?
    let displayName: String
    let description: String?
    let displayIcon: String?
    let assetPath: String?
}

struct RecruitmentData1: Codable{
    let counterId: String?
    let milestoneId: String?
    let milestoneThreshold: Int?
    let useLevelVpCostOverride: Bool?
    let levelVpCostOverride: Int?
    let startDate: String?
    let endDate: String?
}

struct Abilities1: Codable{
    let slot: String?
    let displayName: String?
    let description: String?
    let displayIcon: String?
}

class ViewModel: ObservableObject{
    @Published var personagens: [VaAg] = []
    
    func fetch() {
        guard let url = URL(string: "https://valorant-api.com/v1/agents") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let parsed = try JSONDecoder().decode(Result.self, from: data)
                DispatchQueue.main.async{
                    self?.personagens = parsed.data
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
                LinearGradient(
                    gradient: Gradient(colors: [Color.vavaRed, Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image("valorantLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    ScrollView{
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.personagens, id: \.uuid) { personagem in
                                                        NavigationLink(destination: DetalheView(personagem: personagem)) {
                                                            HStack(spacing: 16) {
                                                                AsyncImage(url: URL(string: personagem.displayIcon)) { image in
                                                                    image
                                                                        .resizable()
                                                                        .scaledToFit()
                                                                } placeholder: {
                                                                    ProgressView()
                                                                }
                                                                .frame(width: 60, height: 60)
                                                                .clipShape(Circle())
                                                                
                                                                Text(personagem.displayName)
                                                                    .foregroundColor(.white)
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
    
    let personagem: VaAg
    
    var body: some View{
        ScrollView {
                    VStack() {
                        AsyncImage(url: URL(string: personagem.fullPortrait ?? personagem.displayIcon)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 250)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text(personagem.displayName)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(personagem.description)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        Divider().background(Color.white)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Função: \(personagem.role.displayName)")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text("Descrição da função: \(personagem.role.description)")
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
                        gradient: Gradient(colors: [Color.black, Color.vavaRed]),
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


