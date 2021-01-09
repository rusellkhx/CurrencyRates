//
//  NetworkServiceProtocol.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import Foundation

typealias IdResponseBlock = (_ Obj: Any?, _ error: Error?) -> Void

protocol NetworkServiceProtocol {
    //var urlRatesSource: String { get }
    //func openUrl(urlString: String)
    
    func request(urlString: String,
                 completion: @escaping (IdResponseBlock))
    
    /*func getRatio(inputCurrencyShortName: String,
                  outputCurrencyShortName: String,
                  completion: @escaping (IdResponseBlock))*/
    
    func createDataTask(from reqest: URLRequest,
                        completion: @escaping (IdResponseBlock)) -> URLSessionDataTask
}




