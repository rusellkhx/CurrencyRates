//
//  Descriptions.swift
//  CurrencyRates
//
//  Created by Rusell on 08.01.2021.
//

import Foundation

struct DescriptionOfCurrencies {
    enum FullName {
        static let USD = "United States Dollar"
        static let EUR = "Euro"
    }
    
    enum ShortName {
        static let USD = "USD"
        static let EUR = "EUR"
    }
}

struct DescriptionOfView {
    static let inputCurrencyPickerViewTitle = "Choose input currency"
    static let outputCurrencyPickerViewTitle = "Choose output currency"
}
