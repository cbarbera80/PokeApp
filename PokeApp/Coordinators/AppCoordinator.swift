//
//  AppCoordinator.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    var coordinators: [Coordinator] = []
    private let navigator = UINavigationController()
    private let bookmarksManager = BookmarkManager()
    private let services: PokemonServices
     
    init(withWindow window: UIWindow, services: PokemonServices) {
        self.window = window
        self.services = services
        
        // Configure cache
        URLCache.shared.memoryCapacity = Constants.memoryCacheSize.mb
        URLCache.shared.diskCapacity = Constants.diskCacheSize.mb
    }
    
    func start() {
        
        let tabBarController = UITabBarController()
        
        let listCoordinator = PokemonListCoordinator(services: services, bookmarksManager: bookmarksManager)
       
        coordinators.append(listCoordinator)
        
        let bookmarksCoordinator = BookmarksCoordinator(bookmarkManager: bookmarksManager)
        coordinators.append(bookmarksCoordinator)
        
        tabBarController.viewControllers = [
            listCoordinator.navigation,
            bookmarksCoordinator.navigation
        ]
        
        coordinators.forEach { $0.start() }
        
        window.rootViewController = tabBarController
        
        window.makeKeyAndVisible()
    }
}
