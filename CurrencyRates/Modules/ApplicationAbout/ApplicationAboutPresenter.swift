//
//  ApplicationAboutPresenter.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutPresenter: ApplicationAboutPresenterProtocol {
    
    var router: ApplicationAboutRouterProtocol!
    var interactor: ApplicationAboutInteractorProtocol!
    weak var view: ApplicationAboutViewControllerProtocol!
    
    required init(view: ApplicationAboutViewControllerProtocol) {
        self.view = view
    }
    
    func configureView() {
        view.setUrlButtonTitle(title: interactor.urlRatesSource)
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
