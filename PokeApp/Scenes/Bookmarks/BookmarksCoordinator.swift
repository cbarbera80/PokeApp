//
//  BookmarksCoordinator.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

class BookmarksCoordinator: Coordinator {
    
    let navigation: UINavigationController
    private let viewController: BookmarksViewController
    private let bookmarkManager: BookmarkManager
    private var detailsCoordinator: PokemonDetailsCoordinator?
    private let services: PokemonServices
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    init(bookmarkManager: BookmarkManager, services: PokemonServices) {
        self.bookmarkManager = bookmarkManager
        self.services = services
        viewController = BookmarksViewController(withViewModel: .init(withBookmarkManager: bookmarkManager))
        navigation = ClearNavigationController(rootViewController: viewController)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
    }
    
    func start() {
        viewController.delegate = self
    }
}

extension BookmarksCoordinator: BookmarksViewControllerDelegate {
    
    func openDetails(withId id: String, pokemon: Pokemon) {
        detailsCoordinator = PokemonDetailsCoordinator(presenter: viewController, id: id, services: services, bookmarksManager: bookmarkManager, pokemon: pokemon)
        detailsCoordinator?.start()
    }
}
