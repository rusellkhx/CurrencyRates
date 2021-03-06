//
//  MainViewController.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private var didSetupConstraints = false
    //var presenter: ApplicationAboutPresenterProtocol?
    
    let currencyPickerView: CurrencyPickerView = {
        let view = CurrencyPickerView()
        return view
    }()
    
    let intoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.mainSubViewInputBackgroundColor)
        return view
    }()
    
    let outoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.mainSubViewOutputBackgroundColor)
        return view
    }()
    
    let currencyRatesView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.mainSuvViewCurrencyRates)
        return view
    }()
    
    // MARK: intoView
    let inputTextField: UITextField = {
        let inputTextField = UITextField()
        inputTextField.textColor = UIColor.appColor(.inputTextColor)
        inputTextField.font = UIFont.appFont(.regular, size: 60)
        inputTextField.minimumFontSize = 20
        inputTextField.adjustsFontSizeToFitWidth = true
        inputTextField.clearButtonMode = .whileEditing
        inputTextField.keyboardType = .decimalPad
        return inputTextField
    }()
    
    let inputCurrencyButton = UIButton(title: DescriptionOfCurrencies.ShortName.USD,
                                       titleColor: UIColor.appColor(.inputTextColor),
                                       backgroundColor: UIColor.appColor(.mainSubViewInputBackgroundColor),
                                       font: UIFont.appFont(.regular, size: 30),
                                       isShadow: false)
    
    // MARK: outoView
    let outputTextLabel = UILabel(text: DescriptionOfCurrencies.ShortName.USD,
                                  textColor: UIColor.appColor(.outputTextColor),
                                  font: UIFont.appFont(.regular, size: 60))
    
    let outputCurrencyButton = UIButton(title: DescriptionOfCurrencies.ShortName.EUR,
                                        titleColor: UIColor.appColor(.outputTextColor),
                                        backgroundColor: UIColor.appColor(.mainSubViewOutputBackgroundColor),
                                        font: UIFont.appFont(.regular, size: 30),
                                        isShadow: false)
    
    // MARK: currencyRatesView
    let currencyRatesTextLabel = UILabel(text: DescriptionOfCurrencies.defaultName.defaultCurrencyRates,
                                         textColor: UIColor.appColor(.defaultText),
                                         font: UIFont.appFont(.bold, size: 14))
    
    let infoButton: UIButton = {
        let infoButton = UIButton()
        infoButton.setImage(UIImage(systemName: DescriptionOfCurrencies.systemImageName.info),
                            for: .normal)
        infoButton.tintColor = UIColor.appColor(.defaultText)
        return infoButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoButton.addTarget(self, action: #selector(open), for: .touchUpInside)
        updateView()
        setupConstraints()
    }
    
    @objc func open() {
        let vc = UINavigationController.init(rootViewController: ApplicationAboutConfigurator.configure())
        present(vc, animated: true, completion: nil)
    }
}

