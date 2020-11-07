//
//  PokemonListCoordinator.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

class PokemonListCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: ClearNavigationController
    let listViewController: PokemonListViewController
    let services: PokemonServices
    let bookmarksManager: BookmarkManager
    var detailsCoordinator: PokemonDetailsCoordinator?
    
    init(services: PokemonServices, bookmarksManager: BookmarkManager = BookmarkManager()) {
        listViewController = PokemonListViewController(withViewModel: PokemonListViewModel(withServices: services))
        self.services = services
        self.bookmarksManager = bookmarksManager
        navigation = ClearNavigationController(rootViewController: listViewController)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0) // )(title: "Pokemons".localized, image: nil, selectedImage: nil)
        
    }
    
    func start() {
        listViewController.delegate = self
    }
}

extension PokemonListCoordinator: PokemonListViewControllerDelegate {
    
    func openDetails(withId id: String) {
        detailsCoordinator = PokemonDetailsCoordinator(presenter: listViewController, id: id, services: services, bookmarksManager: bookmarksManager)
        detailsCoordinator?.start()
    }
}
