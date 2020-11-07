//
//  AppDelegate.swift
//  PokeApp
//
//  Created by Claudio Barbera on 06/11/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator?
    private let theme = MainTheme()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        // Theme
        theme.setupAppearance()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let services = RealPokemonServices()
        let appCoordinator = AppCoordinator(withWindow: window, services: services)
        appCoordinator.start()
        coordinator = appCoordinator
        
        return true
    }
}

