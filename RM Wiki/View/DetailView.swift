//
//  DetailViewModel.swift
//  RM Wiki
//
//  Created by Manuel Martinez on 20/07/22.
//

import SwiftUI

struct DetailViewModel: View {
    
    var character: Result
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                VStack {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .edgesIgnoringSafeArea(.top)
                    
                    Text(character.name.uppercased())
                        .font(.system(size: 32, weight: .bold))
                        .padding(.bottom, 20)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("**Gender:** \(character.gender)")
                            .font(.system(size: 24))
                            .padding(0)
                        HStack{
                            Text("**Status:**")
                                .font(.system(size: 24))
                            Text(character.status)
                                .font(.system(size: 24, weight: .medium))
                            switch character.status {
                            case "Alive":
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(.green)
                            case "unknown":
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(.orange)
                            case "Dead":
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(.red)
                            default:
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                    .foregroundColor(.yellow)
                                
                            }
                        }
                        .padding(0)
                        Text("**Species:** \(character.species)")
                            .font(.system(size: 24))
                            .padding(0)
                        if character.type != "" {
                            Text("**Type:** \(character.type)")
                                .font(.system(size: 24))
                                .padding(0)
                        }
                        Text("**Origin:** \(character.origin.name)")
                            .font(.system(size: 24))
                            .padding(0)
                        Text("**Location:** \(character.location.name)")
                            .font(.system(size: 24))
                            .padding(0)
                        
                    }
                    .padding(.horizontal, 18)
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DetailViewModel_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewModel(character: Result(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", origin: Origin(name: "Earth (Replacement Dimension)"), location: Location(name: "Earth (Replacement Dimension)")))
    }
}
