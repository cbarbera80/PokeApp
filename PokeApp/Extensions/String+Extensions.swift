//
//  String+Extensions.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 iqui All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var strippingExtension: String {
        var components = self.components(separatedBy: ".")
        guard components.count > 1 else { return self }
        components.removeLast()
        return components.joined(separator: ".")
    }
}
