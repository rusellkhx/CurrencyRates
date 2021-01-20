//
//  RouterMain.swift
//  CurrencyRates
//
//  Created by Rusell on 20.01.2021.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {

        let viewController = ApplicationAboutViewController()
        let presenter = ApplicationAboutPresenter(view: ApplicationAboutViewController())
        let interactor = ApplicationAboutInteractor(presenter: presenter)
        let router = ApplicationAboutRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        return viewController
    }
}
