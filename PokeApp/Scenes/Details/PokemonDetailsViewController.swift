//
//  PokemonViewController.swift
//  PokeApp
//
//  Created by Claudio Barbera on 07/11/2020.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    
    // MARK: - UI properties
    
    var _view: PokemonDetailsView? {
        return view as? PokemonDetailsView
    }
    
    // MARK: - Business properties
    private let viewModel: PokemonDetailsViewModel
    
    // MARK: - Object lifecycle
    
    init(withViewModel viewModel: PokemonDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    deinit {
        print("Deinit PokemonDetailsViewController")
    }
    
    override func loadView() {
        view = PokemonDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.onStateChange = { [weak self] state in self?.refreshUI(with: state) }
        viewModel.onBookmarkStateChange = { [weak self] isOn in self?.refreshBookmarksButton(isOn: isOn) }
        viewModel.loadData()
        
    }
    
    // MARK: - Configure methods
    private func configureUI() {
        navigationItem.largeTitleDisplayMode = .never
        refreshBookmarksButton(isOn: viewModel.isPokemonBookmarked)
    }
    
    private func refreshUI(with state: PokemonDetailsViewModel.State) {
        switch state {
        case .loading:
            _view?.startLoading()
        case .idle:
            _view?.stopLoading()
        case .loaded(let pokemonViewModel):
            _view?.stopLoading()
            _view?.pokemonViewModel = pokemonViewModel
        case .error:
            _view?.stopLoading()
        }
    }
    
    @objc
    private func toggleBookmark() {
        viewModel.toggleFavorites()
    }
    
    func refreshBookmarksButton(isOn: Bool) {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: isOn ? "pin_fill" : "pin"), style: .plain, target: self, action: #selector(toggleBookmark))
        
    }
}
