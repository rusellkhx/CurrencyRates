//
//  ApplicationAbout.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

final class ApplicationAboutConfigurator: ApplicationAboutConfiguratorProtocol {
    
    static func configure() -> UIViewController {
        let view = ApplicationAboutViewController()
        let interactor = ApplicationAboutInteractor(networkService: NetworkService())
        let router = ApplicationAboutRouter()
        let presenter = ApplicationAboutPresenter(view: view,
                                                  interactor: interactor,
                                                  router: router)
        
        view.presenter = presenter
        router.view = view
        
        return view
    }
}
