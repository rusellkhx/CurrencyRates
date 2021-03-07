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
    
    func getAllCurrencies(completion: @escaping ([String: Any]?, Error?) -> Swift.Void) {
        if let URL = URL(string: URLAllCurrencies) {
            getJSON(URL: URL, completion: completion)
        }
    }
    
    func getRatio(inputCurrencyShortName: String, outputCurrencyShortName: String, completion: @escaping ([String: Any]?, Error?) -> Swift.Void) {
        let URLString = URLGetRatio(inputCurrencyShortName: inputCurrencyShortName, outputCurrencyShortName: outputCurrencyShortName)
        
        if let URL = URL(string: URLString) {
            getJSON(URL: URL, completion: completion)
        }
    }
    
    // MARK: - Private methods
        
    private func getJSON(URL: URL, completion: @escaping ([String: Any]?, Error?) -> Swift.Void) {
        let sharedSession = URLSession.shared
        
        let dataTask = sharedSession.dataTask(with: URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print("Error to load: \(String(describing: error?.localizedDescription))")
                completion(nil, error)
                return
            }
            
            if let dataResponse = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: dataResponse, options: []) as! [String: AnyObject]
                    
                    print("json: \(json), error: \(String(describing: error))")
                    completion(json, nil)
                    return
                    
                } catch let error as NSError {
                    
                    print("Failed to load: \(error.localizedDescription)")
                    completion(nil, error)
                }
            }
        })
        dataTask.resume()
    }
    
    private let URLAllCurrencies = "https://free.currencyconverterapi.com/api/v5/currencies"
    
    private func URLGetRatio(inputCurrencyShortName: String, outputCurrencyShortName: String) -> String {
        return "https://free.currencyconverterapi.com/api/v5/convert?q=\(inputCurrencyShortName)_\(outputCurrencyShortName)&compact=y"
    }
    
    
    
    
    /*func request(urlString: String, completion: @escaping (IdResponseBlock)) {
     guard let url = URL(string: urlString) else { return }
     let request = URLRequest(url: url)
     let task = createDataTask(from: request, completion: completion)
     task.resume()
     }
     
     internal func createDataTask(from reqest: URLRequest, completion: @escaping (IdResponseBlock)) -> URLSessionDataTask {
     return URLSession.shared.dataTask(with: reqest) { (data, response, error) in
     DispatchQueue.main.async {
     completion(data, error)
     }
     }
     }*/
}

