//
//  BookmarksCoordinator.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

class BookmarksCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let viewController: BookmarksViewController
    let bookmarkManager: BookmarkManager
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    init(bookmarkManager: BookmarkManager) {
        self.bookmarkManager = bookmarkManager
        viewController = BookmarksViewController()
        navigation = ClearNavigationController(rootViewController: viewController)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
    }
    
    func start() {
      
    }
    
}
