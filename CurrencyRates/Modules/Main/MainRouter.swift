//
//  MainRouter.swift
//  CurrencyRates
//
//  Created by Rusell on 22.01.2021.
//
import UIKit

class MainRouter: MainRouterProtocol {

    weak var viewController: MainViewController!
    var navigation: UINavigationController!
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func open(for firstViewController: UIViewController, to secondViewController: UIViewController) {
        firstViewController.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
