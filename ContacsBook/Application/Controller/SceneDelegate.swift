//
//  SceneDelegate.swift
//  ContacsBook
//
//  Created by Лаборатория on 03.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = UINavigationController(rootViewController: ContactsController())
        window.makeKeyAndVisible()
        self.window = window
    }

}

