//
//  ApplicationAboutPresenter.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutPresenter: ApplicationAboutPresenterProtocol {
    
    private let router: ApplicationAboutRouterProtocol
    private let interactor: ApplicationAboutInteractorProtocol
    private weak var view: ApplicationAboutViewControllerProtocol?
    
    init(view: ApplicationAboutViewControllerProtocol,
         interactor: ApplicationAboutInteractorProtocol,
         router: ApplicationAboutRouterProtocol) {
         self.view = view
         self.interactor = interactor
         self.router = router
    }
    
    func configureView() {
        view?.setUrlButtonTitle(title: interactor.urlRatesSource)
    }
    
    func closeButtonPush() {
        router.closeCurrentViewController()
    }
    
    func urlButtonPush(urlString: String?) {
        if let url = urlString {
            interactor.openUrl(urlString: url)
        }
    }
}
