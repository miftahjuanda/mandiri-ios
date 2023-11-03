//
//  SceneDelegate.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 01/11/23.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.backgroundColor = UIColor.white
        
        if let window = window {
            let mainVC = DetailRouter.createModule()
            let navigationController = UINavigationController.init(rootViewController: mainVC)
            navigationController.navigationBar.tintColor = .black
            window.rootViewController = navigationController
        }
        window?.overrideUserInterfaceStyle = .dark
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }
}

