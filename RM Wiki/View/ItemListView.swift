//
//  ItemListView.swift
//  RM Wiki
//
//  Created by Manuel Martinez on 20/07/22.
//

import SwiftUI

struct ItemListView: View {
    
    let character: Result
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
            .frame(width: 160, height: 160)
            .padding()
            
            VStack(alignment: .leading, spacing: 1) {
                Text(character.name)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.top, 20)
                    .foregroundColor(Color("fontColor"))
                    .padding(.bottom)
                HStack{
                    Text("Status: \(character.status)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color("fontColor"))
                    
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
                Text("Specie: \(character.species)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("fontColor"))
                Text("Gender: \(character.gender)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("fontColor"))
                Spacer()
            }
            Spacer()
        }
        .frame(maxHeight: 200)
        .background(
            Color("itemColor")
        )
    }
}

struct ItemListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemListView(character: Result(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", origin: Origin(name: "Earth"), location: Location(name: "Citadel of Ricks")))
    }
}
