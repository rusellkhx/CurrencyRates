//
//  ApplicationProtocols.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import Foundation

protocol ApplicationAboutConfiguratorProtocol: class {
    func configure(viewController: ApplicationAboutViewController)
}

protocol ApplicationAboutPresenterProtocol: class {
    var router: ApplicationAboutRouterProtocol! { set get }
    func configureView()
    func closeButtonPush()
    func urlButtonPush(urlString: String?)
}

protocol ApplicationAboutRouterProtocol {
    func closeCurrentViewController()
}

protocol ApplicationAboutViewControllerProtocol: class {
    func setUrlButtonTitle(title: String)
}

protocol ApplicationAboutInteractorProtocol: class {
    var urlRatesSource: String { get }
    func openUrl(urlString: String)
}

