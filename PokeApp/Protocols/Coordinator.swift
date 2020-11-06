//
//  Coordinator.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 iqui All rights reserved.
//

import Foundation

protocol Coordinator: class {
    func start()
    var coordinators: [Coordinator] { get set }
}

extension Coordinator {
    
    func removeCoordinator<T>(_ coordinator: T) {
        
        for (index, coordinator) in self.coordinators.enumerated() where coordinator is T {
            self.coordinators.remove(at: index)
            break
        }
    }
}
