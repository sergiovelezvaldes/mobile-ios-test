//
//  AppDelegate.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let dependencyManager = DependencyManager()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if let window = window {
            let navigation = UINavigationController()
            if let characterPresenter = Container.defaultContainer().resolve(CharacterPresentationLogic.self){
                navigation.viewControllers = [CharacterController(presenter: characterPresenter)]
                window.rootViewController = navigation
                window.makeKeyAndVisible()
            }
        }
        
        return true
    }
}
