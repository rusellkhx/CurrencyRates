//
//  SceneDelegate.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var firstController: UIViewController!
    var secondTabNavigationControoller: UIViewController!
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
       
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.tintColor = .blue
        tabBarController.tabBar.barTintColor = .white

        let mainVC = MainConfigurator.configure()
        let aboutVC = ApplicationAboutConfigurator.configure()
        
        firstController = mainVC
        secondTabNavigationControoller = aboutVC
        
        tabBarController.viewControllers = [firstController,
                                            secondTabNavigationControoller]
        
        let item1 = UITabBarItem(title: DescriptionOfViewMain.mainViewNameTitle,
                                 image: UIImage.appImage(.wallet),
                                 tag: 0)
        let item2 = UITabBarItem(title: DescriptionOfViewMain.detailViewNameTitle,
                                 image: UIImage.appImage(.about),
                                 tag: 1)
        
        firstController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
        
        self.window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
