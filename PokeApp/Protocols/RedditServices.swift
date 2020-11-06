//
//  Services.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 iqui All rights reserved.
//

import Foundation
import Combine

protocol PokemonServices {
    func getPokemons(page: Int, completion: @escaping (Result<PokemonResponse, Error>) -> Void)
}
