//
//  ApplicationProtocols.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

protocol ApplicationAboutConfiguratorProtocol: class {
    static func configure() -> UIViewController
}

protocol ApplicationAboutPresenterProtocol: class {
    func configureView()
    func closeButtonPush()
    func urlButtonPush(urlString: String?)
}

protocol ApplicationAboutRouterProtocol: class {
    func closeCurrentViewController()
}

protocol ApplicationAboutViewControllerProtocol: class {
    func setUrlButtonTitle(title: String?)
}

protocol ApplicationAboutInteractorProtocol: class {
    var urlRatesSource: String { get }
    func openUrl(urlString: String?)
}

