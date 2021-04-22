//
//  MainPresenterViewController.swift
//  CurrencyRates
//
//  Created by Rusell on 07.03.2021.
//

import UIKit

class MainPresenter {

    // MARK: - Public properties
    
    weak var view: MainViewControllerProtocol?
    weak var currencyPickerView: CurrencyPickerViewProtocol?
    var interactor: MainInteractorProtocol
    var router: MainRouterProtocol
    
    var inputValue: String? {
        set {
            if let value = newValue {
                interactor.inputValue = Double(value) ?? 0.0
            }
        }
        
        get {
            var input = String(interactor.inputValue)
            if input.hasSuffix(".0") {
                input.removeLast(2)
            }
            return input
        }
    }
    
    var outputValue: String? {
        get {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            formatter.roundingMode = .down
            formatter.usesGroupingSeparator = false
            let number = NSNumber(value: interactor.outputValue)
            var output = formatter.string(from: number)
            
            if ((output?.hasSuffix(".00")) != nil) {
                output?.removeLast(0)
            }
            return output
        }
    }
    
    var inputCurrencyShortName: String {
        get {
            print(interactor.inputCurrencyShortName)
            return interactor.inputCurrencyShortName
        }
    }
    var outputCurrencyShortName: String {
        get {
            return interactor.outputCurrencyShortName
        }
    }
    
    var rateText: String {
        get {
            let inputShortName = interactor.inputCurrencyShortName
            let outputRatio = interactor.outputCurrencyRatio
            let outputShortName = interactor.outputCurrencyShortName
            
            return "1 \(inputShortName) = \(outputRatio) \(outputShortName)"
        }
    }
    
    // MARK: - Lifecycle
    
    init(view: MainViewControllerProtocol,
         interactor: MainInteractorProtocol,
         router: MainRouterProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Extension MainPresenterProtocol

extension MainPresenter: MainPresenterProtocol {
    func configureView() {
        view?.setInputValue(with: inputValue)
        view?.setOutputValue(with: outputValue)
        view?.setInputCurrencyShortName(with: inputCurrencyShortName)
        view?.setOutputCurrencyShortName(with: outputCurrencyShortName)
        view?.addDoneOnInputCurrencyKeyboard()
        updateRateText()
        interactor.getAllCurrencies()
    }
    
    func textFieldDidBeginEditing() {
        view?.hidePickerView()
    }
    
    func inputValueChanged(to newInputValue: String) {
        updateOutputValue(with: newInputValue)
    }
    
    func inputValueCleared() {
        updateOutputValue(with: "")
    }
    
    func inputCurrencyButtonClicked() {
        view?.hideKeyboard()
        interactor.inputCurrencyChanging()
        currencyPickerView?.title = DescriptionOfViewMain.inputCurrencyPickerViewTitle
        currencyPickerView?.arrayCurrencyNames = interactor.getCurrencyNames()
        currencyPickerView?.reload()
        currencyPickerView?.selectedCurrencyIndex = interactor.inputCurrencyIndex
        view?.showPickerView()
    }
    
    func outputCurrencyButtonClicked() {
        view?.hideKeyboard()
        interactor.outputCurrencyChanging()
        currencyPickerView?.title = DescriptionOfViewMain.outputCurrencyPickerViewTitle
        currencyPickerView?.arrayCurrencyNames = interactor.getCurrencyNames()
        currencyPickerView?.reload()
        currencyPickerView?.selectedCurrencyIndex = interactor.outputCurrencyIndex
        view?.showPickerView()
    }
    
    func loadCurrenciesButtonClicked() {
        interactor.getAllCurrencies()
    }
    
    func infoButtonClicked() {
        router.showAboutScene()
    }
    
    func updateOutputValue() {
        updateOutputValue(with: inputValue)
    }
    
    func showAlertView(with text: String) {
        view?.showAlertView(with: text)
    }
    
    func inputCurrencyNameUpdated() {
        print(inputCurrencyShortName)
        view?.setInputCurrencyShortName(with: inputCurrencyShortName)
    }
    
    func outputCurrencyNameUpdated() {
        view?.setOutputCurrencyShortName(with: outputCurrencyShortName)
    }
    
    func updateRateText() {
        view?.setRateText(with: rateText)
    }
}


// MARK: - Extension CurrencyPickerViewDelegate

extension MainPresenter: CurrencyPickerViewDelegate {
    func currencyPickerViewCancelButtonClicked() {
        view?.hidePickerView()
    }
    
    func currencyPickerViewApplyButtonClicked(selectedRow: Int) {
        view?.hidePickerView()
        print(selectedRow)
        interactor.currencyChanged(selectedIndex: selectedRow)
    }
    
    // MARK: - Private methods
    
    private func updateOutputValue(with inputText: String?) {
        if let inputText = inputText {
            inputValue = inputText
            view?.setOutputValue(with: outputValue)
        }
        
    }
}

// MARK: - Extension MainInteractorProtocolOutput

extension MainPresenter: MainInteractorProtocolOutput {
    
}
