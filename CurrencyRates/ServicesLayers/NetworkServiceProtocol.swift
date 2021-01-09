//
//  NetworkServiceProtocol.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    var urlRatesSource: String { get }
    func openUrl(urlString: String)
    func getAllCurrencies(completion: @escaping ([String: Any]?, Error?) -> Swift.Void)
    func getRatio(inputCurrencyShortName: String, outputCurrencyShortName: String, completion: @escaping ([String: Any]?, Error?) -> Swift.Void)
}




