//
//  MainTheme.swift
//  PokeApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 Claudio Barbera. All rights reserved.
//

import UIKit

struct MainTheme {
    
    func setupAppearance() {
        setupNavigationAppearance(for: ClearNavigationController.self, withTintColor: .black, andBarTintColor: .clear, isTraslucent: true)
    }
    
    private func setupNavigationAppearance<T: UIAppearanceContainer>(for appearanceContainer: T.Type,
                                                                     withTintColor tintColor: UIColor,
                                                                     andBarTintColor barTintColor: UIColor,
                                                                     isTraslucent: Bool) {
        
        let navigationBarAppearance = UINavigationBar.appearance(whenContainedInInstancesOf: [appearanceContainer])
        
        navigationBarAppearance.isTranslucent = isTraslucent
        navigationBarAppearance.tintColor = tintColor
        navigationBarAppearance.barTintColor = barTintColor
        navigationBarAppearance.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]

    }
    
}
