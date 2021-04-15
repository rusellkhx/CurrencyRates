//
//  MainInteractor.swift
//  CurrencyRates
//
//  Created by Rusell on 07.03.2021.
//

enum CurrencyChangingMode {
    case inputCurrencyChanging
    case outputCurrencyChanging
}

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol?
    let currencyService: CurrencyServiceProtocol?
    let networkService: NetworkServiceProtocol?
    var currencyChangingMode: CurrencyChangingMode?
    weak var output: MainInteractorProtocolOutput?
    
    init(currencyService: CurrencyServiceProtocol,
         networkService: NetworkServiceProtocol) {
        self.currencyService = currencyService
        self.networkService = networkService
    }
    
    // MARK: - MainInteractorProtocol methods
    
    var inputValue: Double {
        get {
            return currencyService?.inputValue ?? 0.0
        }
        set {
            currencyService?.inputValue = newValue
        }
    }
    
    var outputValue: Double {
        get {
            return currencyService?.outputValue ?? 0.0
        }
    }
    
    var inputCurrencyShortName: String {
        get {
            return currencyService?.inputCurrency.shortName ?? "USD"
        }
    }
    
    var outputCurrencyShortName: String {
        get {
            return currencyService?.outputCurrency.shortName ?? "USD"
        }
    }
    
    var inputCurrencyIndex: Int {
        get {
            return currencyService?.inputCurrency.index ?? 1
        }
    }
    
    var outputCurrencyIndex: Int {
        get {
            return currencyService?.outputCurrency.index ?? 1
        }
    }
    
    var outputCurrencyRatio: Double {
        get {
            return currencyService?.outputCurrency.ratio ?? 1
        }
    }
    
    func getAllCurrencies() {
        networkService?.getAllCurrencies { [weak self] (dict, error) in
            guard let self = self else { return }
            if let error = error {
                self.presenter?.showAlertView(with: error.localizedDescription)
                return
            }
            
            if let dictResponse = dict {
                self.currencyService?.saveAllCurrencies(with: dictResponse, completion: { [weak self] (error) in
                    guard let self = self else { return }
                    if let error = error {
                        self.presenter?.showAlertView(with: error.localizedDesc)
                        return
                    }
                    self.currencyService?.sortAndUpdateCurrentCurrencies()
                    self.getOutputCurrencyRatio(newCurrency: nil)
                })
            }
        }
    }
    
    func getOutputCurrencyRatio(newCurrency: Currency?) {
        
        var requestInputCurrencyShortName = inputCurrencyShortName
        var requestOutputCurrencyShortName = outputCurrencyShortName
        
        if let mode = self.currencyChangingMode, let newCurrency = newCurrency {
            switch mode {
            case .inputCurrencyChanging:
                requestInputCurrencyShortName = newCurrency.shortName
            case .outputCurrencyChanging:
                requestOutputCurrencyShortName = newCurrency.shortName
            }
        }
        
        networkService?.getRatio(inputCurrencyShortName: requestInputCurrencyShortName, outputCurrencyShortName: requestOutputCurrencyShortName) { [weak self] (dict, error) in
            guard let self = self else { return }
            
            if error != nil {
                if let errorText = error?.localizedDescription {
                    self.presenter?.showAlertView(with: errorText)
                }
                return
            }
            
            if let dictResponse = dict {
                if let mode = self.currencyChangingMode, let newCurrency = newCurrency {
                    switch mode {
                    case .inputCurrencyChanging:
                        self.currencyService?.inputCurrency = newCurrency
                        self.output?.inputCurrencyNameUpdated()
                    case .outputCurrencyChanging:
                        self.currencyService?.outputCurrency = newCurrency
                        self.output?.outputCurrencyNameUpdated()
                    }
                }
                
                self.currencyService?.saveOutputCurrencyRatio(with: dictResponse, completion: { [weak self] (error) in
                    guard let self = self else { return }
                    if let error = error {
                        self.presenter?.showAlertView(with: error.localizedDesc)
                        return
                    }
                    self.presenter?.updateOutputValue()
                    self.presenter?.updateRateText()
                })
            }
        }
    }
    
    func getCurrencyNames() -> [String] {
        return currencyService?.currencyNames ?? []
    }
    
    func inputCurrencyChanging() {
        currencyChangingMode = .inputCurrencyChanging
    }
    
    func outputCurrencyChanging() {
        currencyChangingMode = .outputCurrencyChanging
    }
    
    func currencyChanged(selectedIndex: Int) {
        if currencyService?.currencies.count ?? 0 > selectedIndex {
            let newCurrency = currencyService?.currencies[selectedIndex]
            getOutputCurrencyRatio(newCurrency: newCurrency)
        }
    }
}
