//
//  MockMapOperation.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

final class MockMapOperation<Model: Decodable> {
    
    func decode(from path: String) -> Model? {
        
        let bundle = Bundle(for: type(of: self))
        let decoder: JSONDecoder =  JSONDecoder()
        
        guard let jsonFile = bundle.path(forResource: path, ofType: "json") else {
            return nil
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFile), options: []) else {
            return nil
        }
        
        let model = try? decoder.decode(Model.self, from: data)
        return model
    }
}
