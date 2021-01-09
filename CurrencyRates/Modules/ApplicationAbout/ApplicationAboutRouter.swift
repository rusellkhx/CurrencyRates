//
//  ApplicationAboutRouter.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutRouter: ApplicationAboutRouterProtocol {
    
    weak var viewController: ApplicationAboutViewController!
    
    required init(viewController: ApplicationAboutViewController) {
        self.viewController = viewController
    }
    
    func closeCurrentViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}
