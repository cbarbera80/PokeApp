//
//  PokemonViewModel.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import Foundation

struct PokemonViewModel {
    let pokemon: Pokemon
    
    init(withPokemon pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var pokemonNameText: String {
        return pokemon.name.capitalized
    }
    
    var pokemonImageURL: URL? {
        guard let id = pokemon.id else { return nil }
        return Constants.baseImageURL.appendingPathComponent("\(id).png")
    }
    
    var id: String? {
        return pokemon.id
    }
}
