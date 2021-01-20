//
//  ApplicationAboutInteractor.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutInteractor: ApplicationAboutInteractorProtocol {
    
    var urlRatesSource = ""
    
    func openUrl(urlString: String) {
        print("")
    }
    
    
    let networkService: NetworkServiceProtocol = NetworkService()
    weak var presenter: ApplicationAboutPresenterProtocol!
    
    required init(presenter: ApplicationAboutPresenterProtocol) {
        self.presenter = presenter
    }


}

