//
//  RealRedditServices.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation
import Combine

class RealPokemonServices: PokemonServices {
   
    let agent = Agent()
    
    func getPokemons(page: Int, completion: @escaping (Result<PokemonResponse, Error>) -> Void) {
        
        guard var urlComponents = URLComponents(url: Constants.baseURL.appendingPathComponent("/pokemon"), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to build url")
        }
           
        let offset = Constants.pageSize * page
        let limit = Constants.pageSize
        
        urlComponents.queryItems = [
            URLQueryItem(name: "offset", value: String(describing: offset)),
            URLQueryItem(name: "limit", value: String(describing: limit))
        ]
        
        guard let url = urlComponents.url else {
            fatalError("Invalid url builded")
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.cachePolicy = .returnCacheDataElseLoad
        
        agent.getData(from: urlRequest, decoding: PokemonResponse.self) { data, error in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
}
