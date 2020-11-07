//
//  Int+Etensions.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 Claudio Barbera All rights reserved.
//


import Foundation

extension Int {
    var mb: Int {
        return kb * 1_024
    }
    
    var kb: Int {
        return self * 1024
    }
}
