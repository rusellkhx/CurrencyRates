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
    
    enum defaultName {
        static let defaultCurrencyRates = "1 USD = 0.83568 EUR"
    }
    
    enum systemImageName {
        static let info = "info.circle"
    }
}

struct DescriptionOfViewMain {
    static let inputCurrencyPickerViewTitle = "Choose input currency"
    static let outputCurrencyPickerViewTitle = "Choose output currency"
    static let mainViewNameTitle = "Currency converter"
    static let aboutViewNameTitle = "About App"
    static let detailViewNameTitle = "Exchange rates"
    static let labelAppNameTitle = "This is a free currency converter"
    static let linkURL = "Special thanks for currency rates to"
    
}

struct DescriptionOfViewApp {
    static let linkURL = "https://free.currencyconverterapi.com"
}

struct DescriptionOfButton {
    static let cancel = "Cancel"
    static let aply = "Aply"
}
