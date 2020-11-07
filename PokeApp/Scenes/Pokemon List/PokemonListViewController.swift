//
//  ViewController.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

protocol PokemonListViewControllerDelegate: class {
    func openDetails(withId id: String, pokemon: Pokemon)
}

class PokemonListViewController: UIViewController {
    
    // MARK: - UI properties
    
    var _view: PokemonListView? {
        return view as? PokemonListView
    }
    
    // MARK: - Business properties
    private let viewModel: PokemonListViewModel
    weak var delegate: PokemonListViewControllerDelegate?
    
    // MARK: - Init
    
    init(withViewModel viewModel: PokemonListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    deinit {
        print("Deinit PokemonListViewController")
    }
    
    override func loadView() {
        view = PokemonListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        title = "Pokemons".localized
        viewModel.onStateChange = { [weak self] state in self?.refreshUI(with: state) }
        viewModel.loadData()
    }
    
    // MARK: - Configure methods
    private func configureUI() {
        _view?.tableView.dataSource = self
        _view?.tableView.delegate = self
        _view?.tableView.register(PokemonListTableViewCell.self)
        _view?.tableView.contentInsetAdjustmentBehavior = .always
        edgesForExtendedLayout = .all
    }
    
    private func refreshUI(with state: PokemonListViewModel.PokemonListViewState) {
        switch state {
        case .loading:
            _view?.startLoading()
        case .loadingNextPage: break
        case .idle:
            _view?.stopLoading()
        case .loaded:
            _view?.stopLoading()
            _view?.tableView.reloadData()
        case .error:
            _view?.stopLoading()
        }
    }
}

extension PokemonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.viewModel = viewModel.pokemonViewModels[indexPath.row]
        return cell
    }
}

extension PokemonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if viewModel.hasMoreData, indexPath.row == viewModel.pokemonViewModels.count - 5 {
            viewModel.loadNextPage()
            _view?.showLoadMoreIndicator()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = viewModel.pokemonViewModels[indexPath.row].id else { return }
        delegate?.openDetails(withId: id, pokemon: viewModel.pokemonViewModels[indexPath.row].pokemon)
    }
}
