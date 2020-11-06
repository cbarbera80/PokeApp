//
//  PokemonViewModel.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import Foundation

struct PokemonViewModel {
    private let pokemon: Pokemon
    
    init(withPokemon pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var pokemonNameText: String {
        return pokemon.name
    }
}
