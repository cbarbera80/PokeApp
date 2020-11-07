//
//  Pokemon.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import Foundation

struct PokemonResponse: Codable {
    let results: [Pokemon]
    private let next: String?
    
    var hasMoreData: Bool {
        return next != nil
    }
}

struct Pokemon: Codable, Hashable {
    let name: String
    let url: String
    
    var id: String? {
        guard let url = URL(string: url) else { return nil }
        return url.lastPathComponent.strippingExtension
    }
}
