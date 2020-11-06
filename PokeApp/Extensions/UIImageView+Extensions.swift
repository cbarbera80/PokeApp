//
//  UIImageView+Extensions.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 iqui All rights reserved.
//

import UIKit

extension UIImageView {
    
    func transition(to image: UIImage) {
        UIView.transition(with: self, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.image = image
        }, completion: nil)
    }
    
    func loadImage(from url: URL?, placeholder: UIImage? = UIImage(named: "placeholder"), completion: (() -> Void)? = nil) {
        guard let url = url else { return }
        
        let request = URLRequest(url: url)
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = URLCache.shared.cachedResponse(for: request)?.data , let image = UIImage(data: data) {
                
                DispatchQueue.main.async { [weak self] in
                    self?.transition(to: image)
                    completion?()
                }
            } else {
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data, let response = response, let image = UIImage(data: data) {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        URLCache.shared.storeCachedResponse(cachedData, for: request)
                        
                        DispatchQueue.main.async { [weak self] in
                            self?.transition(to: image)
                            completion?()
                        }
                    } else if let placeholder = placeholder {
                        DispatchQueue.main.async { [weak self] in
                            self?.transition(to: placeholder)
                            completion?()
                        }
                    }
                }.resume()
            }
        }
    }
}
