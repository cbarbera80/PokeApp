//
//  ReusableView.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 Claudio Barbera All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
