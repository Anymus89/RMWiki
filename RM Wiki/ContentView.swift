//
//  ContentView.swift
//  RM Wiki
//
//  Created by Manuel Martinez on 20/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var searchModel = SearchViewModel()
    @ObservedObject var model = CharacterViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .font(.system(.title2))
                            .padding(.horizontal, 5)
                        TextField("", text: $searchModel.searchInput)
                            .placeholder(when: searchModel.searchInput.isEmpty, placeholder: {
                                Text("Search a Character")
                                    .foregroundColor(.white)
                            })
                            .foregroundColor(.white)
                    }
                    .padding(10)
                    .background(
                        Color("searchBarColor")
                    )
                    .cornerRadius(50)
                    .padding(.horizontal)
                    
                    if searchModel.searchInput == "" {
                        
                        Text("Main Character")
                            .foregroundColor(.primary)
                            .font(.system(size: 36, weight: .heavy))
                            .padding(.horizontal, 15)
                            .padding(.vertical, 0)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(alignment: .leading) {
                                ForEach(model.characters){ item in
                                    NavigationLink(destination: DetailViewModel(character: item)) {
                                        ItemListView(character: item)
                                            .padding(.vertical, 3)
                                            .padding(.horizontal, 15)
                                    }
                                    
                                }
                            }
                        }
                        .padding(0)
                        
                    } else {
                        Text("Results of: \(searchModel.searchInput)")
                            .foregroundColor(.primary)
                            .font(.system(size: 22, weight: .heavy))
                            .padding(.horizontal, 15)
                        
                        // List
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(alignment: .leading) {
                                ForEach(searchModel.characters){ item in
                                    NavigationLink(destination: DetailViewModel(character: item)) {
                                        ItemListView(character: item)
                                            .padding(.vertical, 3)
                                            .padding(.horizontal, 15)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
