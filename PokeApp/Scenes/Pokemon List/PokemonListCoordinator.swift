//
//  PokemonListCoordinator.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

class PokemonListCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let listViewController: PokemonListViewController
    let services: PokemonServices
    let bookmarksManager: BookmarkManager
    
    init(services: PokemonServices, bookmarksManager: BookmarkManager = BookmarkManager()) {
        listViewController = PokemonListViewController(withViewModel: PokemonListViewModel(withServices: services))
        self.services = services
        self.bookmarksManager = bookmarksManager
        navigation = UINavigationController(rootViewController: listViewController)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.tabBarItem = UITabBarItem(title: "Pokemons".localized, image: nil, selectedImage: nil)
        
    }
    
    func start() {

    }
}
