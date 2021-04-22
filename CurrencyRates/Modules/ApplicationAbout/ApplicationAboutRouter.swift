//
//  ApplicationAboutRouter.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutRouter: ApplicationAboutRouterProtocol {
    
    weak var view: ApplicationAboutViewController?
    
    func closeCurrentViewController() {
        view?.dismiss(animated: true, completion: nil)
    }
}
