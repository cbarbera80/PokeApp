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
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.tableFooterView = tableFooterIndicator
        table.tableFooterView?.isHidden = false
        return table
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
        backgroundColor = .white
        
        // tableView
        addSubview(tableView)
        
        // loadingView
        addSubview(loadingView)
        
        // loadingIndicator
        loadingView.addSubview(loadingIndicator)
    }

    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            // tableView
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
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
        tableFooterIndicator.stopAnimating()
        tableView.tableFooterView?.isHidden = true
    }
    
    func showLoadMoreIndicator() {
        tableFooterIndicator.startAnimating()
        tableView.tableFooterView?.isHidden = false
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
