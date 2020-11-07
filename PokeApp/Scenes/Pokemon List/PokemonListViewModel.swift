//
//  PokemonListViewModel.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import Foundation

class PokemonListViewModel {
    
    enum PokemonListViewState {
        case idle
        case loading
        case loadingNextPage
        case loaded
        case error
    }
    
    // MARK: - Vars
    private let services: PokemonServices
    private var currentPage = 0
    var hasMoreData = false
    var pokemonViewModels: [PokemonViewModel] = []
    var onStateChange: ((PokemonListViewState) -> Void)?
    
    var state: PokemonListViewState = .idle {
        didSet {
            onStateChange?(state)
        }
    }
    
    // MARK: - Init
    init(withServices services: PokemonServices) {
        self.services = services
    }
    
    func loadData() {
        
        state = currentPage == 0 ? .loading : .loadingNextPage
        
        services.getPokemons(page: currentPage) { [weak self] res in
            switch res {
            case .success(let response):
                self?.hasMoreData = response.hasMoreData
                self?.pokemonViewModels += response.results.map { PokemonViewModel(withPokemon: $0) }
                self?.state = .loaded
            case .failure:
                self?.state = .error
            }
        }
    }
    
    func loadNextPage() {
    
        if state != .loadingNextPage {
            currentPage += 1
            loadData()
        }
    }
}
