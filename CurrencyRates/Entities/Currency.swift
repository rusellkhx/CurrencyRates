//
//  Entities.swift
//  CurrencyRates
//
//  Created by Rusell on 08.01.2021.
//  Copyright © 2018 Loftymoon. All rights reserved.

import Foundation

class Currency: Decodable {
    
    let shortName: String
    let fullName: String
    var ratio: Double
    var index: Int
    
    required init(fullName: String, shortName: String, ratio: Double, index: Int) {
        
        self.fullName = fullName
        self.shortName = shortName
        self.ratio = ratio
        self.index = index
    }
    
    static func defaultFirstCurrency() -> Currency {
        let currency = self.init(fullName: DescriptionOfCurrencies.FullName.USD,
                                 shortName: DescriptionOfCurrencies.ShortName.USD,
                                 ratio: 1,
                                 index: 0)
        return currency
    }
    
    static func defaultSecondCurrency() -> Currency {
        let currency = self.init(fullName: DescriptionOfCurrencies.FullName.EUR,
                                 shortName: DescriptionOfCurrencies.ShortName.EUR,
                                 ratio: 0.8,
                                 index: 1)
        return currency
    }
    
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        if lhs.fullName == rhs.fullName,
           lhs.shortName == rhs.shortName,
           lhs.ratio == rhs.ratio,
           lhs.index == rhs.index {
            return true
        }
        return false
    }
}
