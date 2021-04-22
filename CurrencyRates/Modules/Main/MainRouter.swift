//
//  MainRouter.swift
//  CurrencyRates
//
//  Created by Rusell on 22.01.2021.
//
import UIKit

class MainRouter: MainRouterProtocol {

    weak var viewController: MainViewController?

    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func showAboutScene() {
        let vc = UINavigationController.init(rootViewController: ApplicationAboutConfigurator.configure())
        viewController?.present(vc, animated: true)
    }
}
