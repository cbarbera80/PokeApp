//
//  BookmarksView.swift
//  PokeApp
//
//  Created by Claudio Barbera on 07/11/2020.
//

import Foundation

class BookmarksView: UIView {
    
    // MARK: - Private properties
    
    // MARK: - UI propertie
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var noDataLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 14)
        view.textColor = .gray
        view.text = "There's no pokemon in you bag ;)"
        view.translatesAutoresizingMaskIntoConstraints = false
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
        
        // emptyView
        addSubview(emptyView)
        
        // noDataLabel
        emptyView.addSubview(noDataLabel)
    }

    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            // tableView
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // emptyView
            emptyView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            // noDataLabel
            noDataLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor),
            noDataLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
        ])
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct BookmarksView_Previews: PreviewProvider {
    
    static var previews: some View {
        BookmarksView().makePreview().previewLayout(.fixed(width: 375, height: 812))
    }
}
#endif
