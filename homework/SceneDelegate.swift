//
//  SceneDelegate.swift
//  homework
//
//  Created by Павел Терешонок on 20.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let chatListViewController = ChatListViewController(title: "Pop")
        let navigatorController = UINavigationController(rootViewController: chatListViewController)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigatorController
        window?.makeKeyAndVisible()
        
    }

}

