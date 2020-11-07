//
//  BookmarksViewModel.swift
//  PokeApp
//
//  Created by Claudio Barbera on 07/11/2020.
//

import Foundation

class BookmarksViewModel {
    
    private let manager: BookmarkManager
    var onReloadBookmarks: (() -> Void)?
    
    var pokemonViewModels: [PokemonViewModel] {
        return manager.bookmarks.map { PokemonViewModel(withPokemon: $0) }
    }
    
    var isEmpty: Bool {
        manager.bookmarks.isEmpty
    }
    
    // MARK: - Init
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    init(withBookmarkManager manager: BookmarkManager) {
        self.manager = manager
        NotificationCenter.default.addObserver(self, selector: #selector(reloadBookmarks), name: Notifications.bookmarksUpdated, object: nil)
    }
    
    @objc
    private func reloadBookmarks() {
        onReloadBookmarks?()
    }
    
}
