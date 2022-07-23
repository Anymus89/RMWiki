//
//  SearchViewModel.swift
//  RM Wiki
//
//  Created by Manuel Martinez on 20/07/22.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var searchInput: String = ""
    
    @Published var resultText: String = ""
    
    var searchCancellable: AnyCancellable? = nil
    
    init() {
        searchCancellable = $searchInput
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                
                if str == "" {
                    
                    self.characters.removeAll()
                    self.resultText = ""
                    
                } else {
                    self.characters.removeAll()
                    self.searchCharacters(name: str)
                }
                
            })
    }
    
    let didChange = PassthroughSubject<SearchViewModel, Never>()
    
    @Published var characters = [Result]() {
        didSet {
            didChange.send(self)
            
            
            self.resultText = "Results of: \(self.searchInput)"
            
            
        }
    }
    
    func searchCharacters(name: String) {
        NetworkManager().getCharacters(stringUrl: "https://rickandmortyapi.com/api/character/?name=\(name)") {
            
            self.characters = $0.results
            
        }
        
    }
    
}
