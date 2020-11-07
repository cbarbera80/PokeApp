//
//  BookmarksViewController.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

protocol BookmarksViewControllerDelegate: class {
    func openDetails(withId id: String, pokemon: Pokemon)
}

class BookmarksViewController: UIViewController {

    // MARK: - Vars
    private let viewModel: BookmarksViewModel
    var delegate: BookmarksViewControllerDelegate?
    var _view: BookmarksView? {
        return view as? BookmarksView
    }
    
    // MARK: - Init
    
    init(withViewModel viewModel: BookmarksViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      
    // MARK: - View lifecycle
    
    deinit {
        print("Deinit BookmarksViewController")
    }
    
    override func loadView() {
        view = BookmarksView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.onReloadBookmarks = {
            [weak self] in
            self?._view?.tableView.reloadData()
            self?._view?.emptyView.isHidden = !(self?.viewModel.isEmpty ?? false)
        }
    }
    
    // MARK: - Configure methods
    private func configureUI() {
        title = "Bookmarks".localized
        _view?.tableView.dataSource = self
        _view?.tableView.delegate = self
        _view?.tableView.register(PokemonListTableViewCell.self)
        _view?.tableView.contentInsetAdjustmentBehavior = .always
        edgesForExtendedLayout = .all
    }
}

extension BookmarksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.viewModel = viewModel.pokemonViewModels[indexPath.row]
        return cell
    }
}

extension BookmarksViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vm = viewModel.pokemonViewModels[indexPath.row]
        guard let id = vm.id else { return }
        delegate?.openDetails(withId: id, pokemon: vm.pokemon)
    }
}
