//
//  MainProtocols.swift
//  CurrencyRates
//
//  Created by Rusell on 20.01.2021.
//  Copyright © 2018 Loftymoon. All rights reserved.

import Foundation
import UIKit

protocol MainViewControllerProtocol: class {
    func setInputValue(with value: String?)
    func setOutputValue(with value: String?)
    func setInputCurrencyShortName(with shortName: String)
    func setOutputCurrencyShortName(with shortName: String)
    func addDoneOnInputCurrencyKeyboard()
    //func showHUD()
    func showLoadCurrenciesButton()
    //func hideHUD()
    func showAlertView(with text: String)
    func showPickerView()
    func hidePickerView()
    func hideKeyboard()
    func setRateText(with rateText: String)
}

protocol MainPresenterProtocol: class {
    var router: MainRouterProtocol! { set get }
    var rateText: String { get }
    func configureView()
    func textFieldDidBeginEditing()
    func inputValueChanged(to newInputValue: String)
    func inputValueCleared()
    func inputCurrencyButtonClicked()
    func outputCurrencyButtonClicked()
    func loadCurrenciesButtonClicked()
    func infoButtonClicked()
    func showHUD()
    func showLoadCurrenciesButton()
    func hideHUD()
    func updateOutputValue()
    func showAlertView(with text: String)
    func inputCurrencyNameUpdated()
    func outputCurrencyNameUpdated()
    func updateRateText()
}

protocol MainInteractorProtocol: class {
    var inputValue: Double { set get }
    var outputValue: Double { get }
    var inputCurrencyShortName: String { get }
    var outputCurrencyShortName: String { get }
    var inputCurrencyIndex: Int { get }
    var outputCurrencyIndex: Int { get }
    var outputCurrencyRatio: Double { get }
    func getAllCurrencies()
    func getCurrencyNames() -> [String]
    func inputCurrencyChanging()
    func outputCurrencyChanging()
    func currencyChanged(selectedIndex: Int)
}

protocol MainRouterProtocol: class {
    //func showAboutScene()
    //func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func open(for viewController: UIViewController, to: UIViewController)
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}
