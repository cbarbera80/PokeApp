//
//  Constants.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import Foundation

struct Constants {
    static let memoryCacheSize = 30
    static let diskCacheSize = 10
    static let pageSize = 20
    static let baseURL = URL(string: "https://pokeapi.co/api/v2")!
    static let baseImageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back")!
}
