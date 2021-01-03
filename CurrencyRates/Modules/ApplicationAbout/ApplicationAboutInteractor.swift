//
//  ApplicationAboutInteractor.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutInteractor: ApplicationAboutInteractorProtocol {
    
    let networkService: NetworkServiceProtocol = NetworkService()
    weak var presenter: ApplicationAboutPresenterProtocol!
    
    required init(presenter: ApplicationAboutPresenterProtocol) {
        self.presenter = presenter
    }
    
    var urlRatesSource: String {
        get {
            return networkService.urlRatesSource
        }
    }
    
    func openUrl(urlString: String) {
        networkService.openUrl(urlString: urlString)
    }

}

