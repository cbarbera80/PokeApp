//
//  MockRedditServices.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

class MockPokemonServices: PokemonServices {
    
    func getPokemons(page: Int, completion: @escaping (Result<PokemonResponse, Error>) -> Void) {
        
        let mock = MockMapOperation<PokemonResponse>()
        
        guard let data = mock.decode(from: "pokemons") else {
    
            completion(.failure(AppError.invalidMapping))
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            completion(.success(data))
        }
    }
}
