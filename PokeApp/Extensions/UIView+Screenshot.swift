//
//  UIView+Etensions.swift
//  PokeApp
//
//  Created by claudio barbera
//  Copyright © 2020 Claudio Barbera All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var screenshot: UIImage? {
       
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
       
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("Unable to get current context")
        }
        
        if let tableView = self as? UITableView, let superview = tableView.superview {
            superview.layer.render(in: context)
        } else {
            layer.render(in: context)
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
