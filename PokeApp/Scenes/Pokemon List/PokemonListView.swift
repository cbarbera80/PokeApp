//
//  PokemonListView.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

class PokemonListView: UIView {
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    lazy var tableFooterIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .gray)
        return spinner
    }()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loadingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
    }()
    
    // MARK: - Object lifecycle
        
    init() {
        super.init(frame: .zero)
        configureUI()
        configureConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    // MARK: - Configure methods
    
    private func configureUI() {
        backgroundColor = UIColor(named: "AccentColor")
        
        // collectionView
        addSubview(collectionView)
        
        // loadingView
        addSubview(loadingView)
        
        // loadingIndicator
        loadingView.addSubview(loadingIndicator)
    }

    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            // tableView
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // loadingView
            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // loadingIndicator
            loadingIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            loadingIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor)
        ])
    }
    
    func startLoading() {
        loadingView.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func stopLoading() {
        loadingView.isHidden = true
        loadingIndicator.stopAnimating()
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PokemonListView_Previews: PreviewProvider {
    
    static var previews: some View {
        PokemonListView().makePreview().previewLayout(.fixed(width: 375, height: 812))
    }
}
#endif
