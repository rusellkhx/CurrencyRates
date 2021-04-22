//
//  ApplicationAboutPresenter.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutPresenter {
    
    // MARK: - Private properties
    
    private let router: ApplicationAboutRouterProtocol?
    private let interactor: ApplicationAboutInteractorProtocol?
    private weak var view: ApplicationAboutViewControllerProtocol?
    
    // MARK: - Lifecycle
    
    init(view: ApplicationAboutViewControllerProtocol,
         interactor: ApplicationAboutInteractorProtocol,
         router: ApplicationAboutRouterProtocol) {
         self.view = view
         self.interactor = interactor
         self.router = router
    }
}

// MARK: - Extension
    
extension ApplicationAboutPresenter: ApplicationAboutPresenterProtocol {
    func configureView() {
        view?.setUrlButtonTitle(title: interactor?.urlRatesSource)
    }
    
    func closeButtonPush() {
        router?.closeCurrentViewController()
    }
    
    func urlButtonPush(urlString: String?) {
        if let url = urlString {
            interactor?.openUrl(urlString: url)
        }
    }
}
