//
//  PokemonListView.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import Anchorage

class PokemonListView: UIView {
    
    // MARK: - Private properties
    
    // MARK: - UI properties
    lazy var tableFooterIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .gray)
        return spinner
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.tableFooterView = tableFooterIndicator
        table.tableFooterView?.isHidden = false
        return table
    }()
    
    lazy var loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
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
        // tableView
        tableView.edgeAnchors == edgeAnchors
        
        // loadingView
        loadingView.edgeAnchors == edgeAnchors
        
        // loadingIndicator
        loadingIndicator.centerYAnchor == loadingView.centerYAnchor
        loadingIndicator.centerXAnchor == loadingView.centerXAnchor
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
