//
//  SceneDelegate.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var firstController : UIViewController!
    var secondTabNavigationControoller : UINavigationController!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let tabBarController = UITabBarController()
        let mainVC = ModuleBuilder.createMainModule() //MainViewController()
        let aboutVC = ApplicationAboutViewController()
        
        
        firstController = mainVC
        secondTabNavigationControoller = UINavigationController.init(rootViewController: aboutVC)
        
        tabBarController.viewControllers = [firstController,
                                            secondTabNavigationControoller]
        
        let item1 = UITabBarItem(title: DescriptionOfView.mainViewNameTitle,
                                 image: UIImage.appImage(.wallet),
                                 tag: 0)
        let item2 = UITabBarItem(title: DescriptionOfView.detailViewNameTitle,
                                 image: UIImage.appImage(.wallet),
                                 tag: 1)
        
        firstController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
        
        self.window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
}

