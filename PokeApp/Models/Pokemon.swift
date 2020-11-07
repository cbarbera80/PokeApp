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

struct PokemonDetails: Codable {
    let name: String
    let id: Int
    let abilities: [AbilityDetails]
    let stats: [StatDetails]
    let types: [TypeDetails]
    let sprites: Sprites?
    let height: Float
    let weight: Float
    
    static var mocked: PokemonDetails {
        return PokemonDetails(name: "Pokemon Test", id: 1, abilities: [], stats: [], types: [], sprites: nil, height: 10, weight: 20)
    }
}

struct AbilityDetails: Codable {
    let ability: Detail
}

struct StatDetails: Codable {
    let stat: Detail
}

struct TypeDetails: Codable {
     let type: Detail
}

struct Detail: Codable {
    let name: String
    let url: String
}

struct Sprites: Codable {
    let frontDefault: String
    let other: OtherSprites
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_shiny"
        case other
    }
}

struct OtherSprites: Codable {
    let official: OtherSpritesDetails
    
    enum CodingKeys: String, CodingKey {
        case official = "official-artwork"
    }
}

struct OtherSpritesDetails: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
