//
//  ApplicationAboutInteractor.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutInteractor: ApplicationAboutInteractorProtocol {
    
    let networkService: NetworkServiceProtocol
    
    var urlRatesSource: String {
        get {
            return networkService.urlRatesSource
        }
    }
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func openUrl(urlString: String?) {
        if let urlString = urlString {
            networkService.openUrl(urlString: urlString)
        }
    }
}

