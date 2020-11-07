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
    private let bookmarksManager: BookmarkManager
    private let pokemon: Pokemon
    var onStateChange: ((State) -> Void)?
    var onBookmarkStateChange: ((Bool) -> Void)?
    
    var state: State = .idle {
        didSet {
            onStateChange?(state)
        }
    }
    
    var isPokemonBookmarked: Bool {
        return bookmarksManager.contains(pokemon)
    }
    
    // MARK: - Init
    init(withServices services: PokemonServices, id: String, bookmarksManager: BookmarkManager, pokemon: Pokemon) {
        self.services = services
        self.id = id
        self.pokemon = pokemon
        self.bookmarksManager = bookmarksManager
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
    
    func toggleFavorites() {
        bookmarksManager.toggleState(pokemon)
        NotificationCenter.default.post(name: Notifications.bookmarksUpdated, object: nil)
        onBookmarkStateChange?(bookmarksManager.contains(pokemon))
    }
    
}
