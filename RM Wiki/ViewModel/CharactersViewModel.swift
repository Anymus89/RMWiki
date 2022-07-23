//
//  CharactersViewModel.swift
//  RM Wiki
//
//  Created by Manuel Martinez on 20/07/22.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    
    init() {
        self.getCharacters()
    }
    
    let didChange = PassthroughSubject<CharacterViewModel, Never>()
    
    @Published var characters = [Result]() {
        didSet {
            didChange.send(self)
        }
    }
    
    func getCharacters() {
        NetworkManager().getCharacters(stringUrl: "https://rickandmortyapi.com/api/character") {
            
            self.characters = $0.results
            
        }
    }
    
}
