//
//  PokemonDetailsCoordinator.swift
//  PokeApp
//
//  Created by Claudio Barbera on 07/11/2020.
//

import UIKit

class PokemonDetailsCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []

    private let detailsViewController: PokemonDetailsViewController
    private let presenter: UIViewController
    
    init(presenter: UIViewController, id: String, services: PokemonServices, bookmarksManager: BookmarkManager) {
        self.presenter = presenter
        detailsViewController = PokemonDetailsViewController(withViewModel: .init(withServices: services, id: id))
    }
    
    func start() {
        presenter.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
