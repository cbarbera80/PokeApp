//
//  Services.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 Claudio Barbera All rights reserved.
//

import Foundation
import Combine

protocol PokemonServices {
    func getPokemons(page: Int, completion: @escaping (Result<PokemonResponse, Error>) -> Void)
    func getPokemon(withId id: String, completion: @escaping (Result<PokemonDetails, Error>) -> Void)
}
