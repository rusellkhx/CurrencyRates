//
//  NetworkService.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class NetworkService: NetworkServiceProtocol {

    func request(urlString: String, completion: @escaping (IdResponseBlock)) {
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
    }
}
        
