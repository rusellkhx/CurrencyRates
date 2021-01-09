//
//  NetworkService.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class NetworkService: NetworkServiceProtocol {
    // MARK: Properties
    
    var urlRatesSource: String {
        return "https://free.currencyconverterapi.com"
    }
    
    // MARK: Properties
    func getAllCurrencies(completion: @escaping ([String : Any]?, Error?) -> Void) {
        <#code#>
    }
    
    func getRatio(inputCurrencyShortName: String, outputCurrencyShortName: String, completion: @escaping ([String : Any]?, Error?) -> Void) {
        <#code#>
    }
    
   
    
    func openUrl(urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
