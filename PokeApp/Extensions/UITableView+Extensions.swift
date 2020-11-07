//
//  UITableView+Extensions.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 Claudio Barbera All rights reserved.
//

import UIKit

extension UITableView {
    
    func hideEmptyRows() {
        self.tableFooterView = UIView(frame: .zero)
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}
