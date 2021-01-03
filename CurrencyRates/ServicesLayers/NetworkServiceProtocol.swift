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
}
