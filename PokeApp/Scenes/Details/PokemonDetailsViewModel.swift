//
//  PokemonDetailsViewModel.swift
//  PokeApp
//
//  Created by Claudio Barbera on 07/11/2020.
//

import Foundation

class PokemonDetailsViewModel {
    
    enum State {
        case idle
        case loading
        case loaded(pokemon: PokemonDetailViewModel)
        case error
    }
    
    // MARK: - Vars
    private let services: PokemonServices
    private let id: String
    var onStateChange: ((State) -> Void)?
    
    var state: State = .idle {
        didSet {
            onStateChange?(state)
        }
    }
    
    // MARK: - Init
    init(withServices services: PokemonServices, id: String) {
        self.services = services
        self.id = id
    }
    
    // MARK: - Business
    func loadData() {
    
        state = .loading
        
        services.getPokemon(withId: id) { [weak self] res in
            switch res {
            case .success(let response):
                self?.state = .loaded(pokemon: PokemonDetailViewModel(withPokemon: response))
            case .failure:
                self?.state = .error
            }
        }
    }
    
}
