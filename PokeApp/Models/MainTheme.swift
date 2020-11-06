//
//  MainTheme.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 16/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import UIKit

struct MainTheme {
    
    func setupAppearance() {
        
        setupNavigationAppearance(for: WhiteNavigationController.self, withTintColor: UIColor(named: "primary")!, andBarTintColor: .white, isTraslucent: true)
    }
    
    private func setupNavigationAppearance<T: UIAppearanceContainer>(for appearanceContainer: T.Type, withTintColor tintColor: UIColor, andBarTintColor barTintColor: UIColor, isTraslucent: Bool) {
        
        let navigationBarAppearance = UINavigationBar.appearance(whenContainedInInstancesOf: [appearanceContainer])
        
        navigationBarAppearance.isTranslucent = isTraslucent
        navigationBarAppearance.tintColor = tintColor
        navigationBarAppearance.barTintColor = barTintColor

        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold), NSAttributedString.Key.foregroundColor: tintColor]
        
        navigationBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 37, weight: .bold), NSAttributedString.Key.foregroundColor: tintColor]
        
        
    }
}
