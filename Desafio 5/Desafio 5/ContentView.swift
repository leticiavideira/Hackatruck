//
//  ContentView.swift
//  Desafio 5
//
//  Created by Turma02-18 on 16/09/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    struct Location: Hashable {
        var nome: String
        var foto: String
        var descricao: String
        var lat: Double
        var long: Double
    }
    
    var arrayLocais = [
        Location(nome: "Torre Eiffel", foto: "https://i.pinimg.com/736x/df/87/b3/df87b333dd5e7f61944c468379b8dce2.jpg", descricao: "A Torre Eiffel, localizada no coração de Paris, França, é uma das estruturas mais emblemáticas e visitadas do mundo. Construída entre 1887 e 1889 pelo engenheiro Gustave Eiffel para a Exposição Universal de 1889, que comemorava o centenário da Revolução Francesa, a torre inicialmente recebeu críticas, mas rapidamente se tornou um símbolo duradouro da inovação e da arquitetura francesa. Com 324 metros de altura, foi a estrutura mais alta do mundo até 1930 e continua sendo um ponto de referência arquitetônico e turístico. A torre é composta por uma estrutura de ferro forjado e possui três plataformas acessíveis ao público, oferecendo vistas panorâmicas espetaculares da cidade de Paris. Além de sua importância histórica e arquitetônica, a Torre Eiffel também é famosa por suas iluminações noturnas e eventos culturais, atraindo milhões de visitantes todos os anos.", lat: +48.8584, long: +2.2945),
        Location(nome: "Coliseu", foto: "https://i.pinimg.com/1200x/98/3d/08/983d0825a5c1bfcb6081cc350c8d82cb.jpg", descricao: "O Coliseu, também conhecido como Anfiteatro Flaviano, é um dos monumentos mais famosos e impressionantes da Roma Antiga, localizado no centro de Roma, Itália. Construído entre os anos 70 e 80 d.C. durante o governo dos imperadores da dinastia Flaviana, o Coliseu foi projetado para sediar grandes espetáculos públicos, como lutas de gladiadores, simulações de batalhas navais, caças a animais selvagens e execuções. Com capacidade para cerca de 50 mil espectadores, essa enorme estrutura elíptica, feita de pedra e concreto, é um marco da engenharia e arquitetura romana. Apesar dos séculos de terremotos, saques e desgaste natural, o Coliseu mantém sua imponência e continua a ser um símbolo da história e cultura romana. Atualmente, é uma das atrações turísticas mais visitadas do mundo, representando a grandiosidade e complexidade do Império Romano.", lat: +41.8902, long: +12.4922),
        Location(nome: "Taj Mahal", foto: "https://i.pinimg.com/736x/ab/87/77/ab8777c977ecf064988de36dba0dfd83.jpg", descricao: "O Taj Mahal é um mausoléu de mármore branco localizado em Agra, na Índia, e é amplamente reconhecido como uma das maiores obras-primas da arquitetura mogol. Construído entre 1632 e 1653 pelo imperador Shah Jahan em memória de sua esposa Mumtaz Mahal, o monumento simboliza o amor eterno. Com uma combinação impressionante de estilos arquitetônicos islâmico, persa e indiano, o Taj Mahal destaca-se por sua cúpula central majestosa, minaretes simétricos e intrincados trabalhos em mármore esculpido, incluindo detalhes florais e inscrições em caligrafia árabe. O complexo inclui jardins cuidadosamente planejados e uma piscina refletora que espelha a beleza do mausoléu. Reconhecido como Patrimônio Mundial da UNESCO, o Taj Mahal atrai milhões de visitantes todos os anos e é considerado uma das maravilhas do mundo, além de um símbolo universal do amor.", lat: +27.1751, long: +78.0421),
        
    ]
    
    @State var selectedLocation: Location?
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    var body: some View {
        ZStack {
            Map(position: $position)
                .ignoresSafeArea()
            
            ForEach (Location, id: \.self){ local in
                let coordinate = CLLocationCoordinate2D(latitude: local.lat, longitude: local.long)
                
                Annotation(local.nome, coordinate: coordinate){
                    VStack{
                        Image(systemName: "mappin.circle.fill")
                            .foregroundStyle(.pink)
                            .font(.title)
                        Text(local.nome)
                            .font(.caption2)
                            .foregroundStyle(.black)
                    }
                }
                
            }
             
            VStack{
                
                Picker("Local", selection: $selectedLocation) {
                    ForEach(arrayLocais, id: \.self) { local in
                        Text(local.nome).tag(Optional(local))
                                                                    }
                }
                
                .pickerStyle(.menu)
                .frame(width: 150, height: 50)
                .background(.salmao)
                .cornerRadius(8)
                .tint(.pink)
                
                
                
                Spacer()
                
                Text("Maravilhas do mundo moderno")
                    .frame(width: 300, height: 50)
                    .background(.salmao)
                    .cornerRadius(8)
                    .foregroundStyle(.pink)
            }
            
        }
        .onChange(of: selectedLocation) { newValue in
                    if let local = newValue {
                        withAnimation {
                            position = .region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: local.lat, longitude: local.long),
                                    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                                )
                            )
                        }
                    }
                }
    }
}


struct informacao: View{
    
    @State var nome: String
    @State var foto: String
    @State var descricao: String
    
    var body: some View{
        ZStack{
            Color.salmao
                .ignoresSafeArea()
            
            VStack{
                Text(nome)
                    .font(.title)
                
                AsyncImage(url: URL(string: foto)) { image in
                    image.resizable().scaledToFit().frame(height: 200)
                } placeholder: {
                    ProgressView()
                }
                
                Text(descricao)
                    .font(.caption)
                    
            }
        }
    }
}



    #Preview {
        ContentView()
    }

