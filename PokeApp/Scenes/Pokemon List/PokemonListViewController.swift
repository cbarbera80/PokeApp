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
        navigationController?.delegate = self
        title = "Pokemons".localized
        viewModel.onStateChange = { [weak self] state in self?.refreshUI(with: state) }
        viewModel.loadData()
    }
    
    // MARK: - Configure methods
    private func configureUI() {
        _view?.collectionView.dataSource = self
        _view?.collectionView.delegate = self
        _view?.collectionView.register(PokemonListCollectionViewCell.self)
        _view?.collectionView.contentInsetAdjustmentBehavior = .always
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
            _view?.collectionView.reloadData()
        case .error:
            _view?.stopLoading()
        }
    }
}

extension PokemonListViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemonViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokemonListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.viewModel = viewModel.pokemonViewModels[indexPath.item]
        return cell
    }
}

extension PokemonListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let availableWidth = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right))
//
//        let minWidth: CGFloat = 150
//        let rows = Int(availableWidth / minWidth)
//        let additionalPadding = CGFloat(rows) * CGFloat(10)
//        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + additionalPadding)) / CGFloat(rows)
//        return CGSize(width: itemSize, height: itemSize)
        
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    func calculateWith() -> CGFloat {
        let estimateWidth = 200
        let cellMarginSize = 16
        
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.indexPath = indexPath
        guard let id = viewModel.pokemonViewModels[indexPath.item].id else { return }
        delegate?.openDetails(withId: id, pokemon: viewModel.pokemonViewModels[indexPath.row].pokemon)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if viewModel.hasMoreData, indexPath.row == viewModel.pokemonViewModels.count - 5 {
            viewModel.loadNextPage()
        }
    }
}

//MARK: UINavigationControllerDelegate
extension PokemonListViewController: UINavigationControllerDelegate {
  
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PopInAndOutAnimator(operation: operation)
    }
}

//MARK: CollectionPushAndPoppable
extension PokemonListViewController: CollectionPushAndPoppable {
    var sourceCell: UICollectionViewCell? {
        return _view?.collectionView.cellForItem(at: viewModel.indexPath)
    }
    
    var collectionView: UICollectionView? {
        return _view?.collectionView
    }
}
