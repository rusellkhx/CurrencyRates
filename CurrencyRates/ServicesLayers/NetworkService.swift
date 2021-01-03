//
//  NetworkService.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class NetworkService: NetworkServiceProtocol {
    var urlRatesSource: String {
        return "https://free.currencyconverterapi.com"
    }
    
    func openUrl(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
