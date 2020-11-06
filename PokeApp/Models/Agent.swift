//
//  Agent.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

struct Agent {
    
    let decoder: JSONDecoder
    
    init() {
        self.decoder = JSONDecoder()
    }
    
    func getData<T: Decodable>(from request: URLRequest, decoding: T.Type, completion: @escaping (T?, Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            DispatchQueue.main.async {
                if let data = data, let model = try? self.decoder.decode(decoding, from: data) {
                    completion(model, nil)
                } else if let error = error {
                    completion(nil, error)
                } else {
                    completion(nil, AppError.invalidMapping)
                }
            }
        }
        
        task.resume()
    }
}
