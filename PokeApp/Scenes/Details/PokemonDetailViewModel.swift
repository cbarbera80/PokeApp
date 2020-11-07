//
//  PokemonDetailViewModel.swift
//  PokeApp
//
//  Created by Claudio Barbera on 07/11/2020.
//

import Foundation

struct PokemonDetailViewModel {
    
    private let pokemon: PokemonDetails
    
    init(withPokemon pokemon: PokemonDetails) {
        self.pokemon = pokemon
    }
    
    var pokemonNameText: String {
        return pokemon.name.capitalized
    }

    var pokemonImageURL: URL? {
        guard let sprites = pokemon.sprites else { return nil }
        return URL(string: sprites.other.official.frontDefault)
    }
    
    var heightText: String {
        // height is expressed in decimeters
        return "\("Height".localized): \(pokemon.height / 10) m"
    }
    
    var weightText: String {
        // weight is expressed in hectograms
        return "\("Weigth".localized) \(pokemon.weight / 10) kg"
    }
    
    var abilities: [String] {
        return pokemon.abilities.map { $0.ability.name }
    }
    
    var stats: [String] {
        return pokemon.stats.map { $0.stat.name }
    }
    
    var types: [String] {
        return pokemon.types.map { $0.type.name }
    }
}
