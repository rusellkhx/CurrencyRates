//
//  ApplicationAbout.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutConfigurator: ApplicationAboutConfiguratorProtocol {
    
    func configure(viewController: ApplicationAboutViewController) {
        let presenter = ApplicationAboutPresenter(view: viewController)
        let interactor = ApplicationAboutInteractor(presenter: presenter)
        let router = ApplicationAboutRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
