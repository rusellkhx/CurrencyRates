//
//  CurrencyView.swift
//  CurrencyRates
//
//  Created by Rusell on 25.01.2021.
//

import UIKit
import SnapKit

class CurrencyView: UIView {
    
    
    
    /*let currencyPickerView: CurrencyPickerView = {
        let view = CurrencyPickerView()
        return view
    }()*/
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //addSubview(view)
        addSubview(intoView)
        addSubview(outoView)
        addSubview(currencyRatesView)
        
        intoView.addSubview(inputTextField)
        intoView.addSubview(inputCurrencyButton)
        outoView.addSubview(outputTextLabel)
        outoView.addSubview(outputCurrencyButton)
        currencyRatesView.addSubview(currencyRatesTextLabel)
        currencyRatesView.addSubview(infoButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        
        
        intoView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(25)
            make.left.right.equalTo(self).inset(20)
            make.height.equalTo(70)
            make.centerX.equalTo(self)
        }
        
        outoView.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(20)
            make.top.equalTo(intoView.snp.bottom).offset(5)
            make.height.equalTo(70)
        }
        
        currencyRatesView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(outoView.snp.bottom).offset(20)
            make.height.equalTo(28)
        }
        
        inputTextField.snp.makeConstraints { make in
            make.left.equalTo(intoView).inset(5)
            make.top.bottom.equalTo(intoView)
            make.right.equalTo(inputCurrencyButton.snp.left)
            make.width.equalTo(200)
            make.height.equalTo(70)
        }
        
        inputCurrencyButton.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(intoView)
            make.left.equalTo(inputTextField.snp.right)
            make.width.height.equalTo(70)
        }
        
        outputTextLabel.snp.makeConstraints { make in
            make.left.equalTo(outoView).inset(5)
            make.top.bottom.equalTo(outoView)
            make.right.equalTo(outputCurrencyButton.snp.left)
            make.width.equalTo(200)
            make.height.equalTo(70)
        }
        
        outputCurrencyButton.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(outoView)
            make.left.equalTo(outputTextLabel.snp.right)
            make.width.height.equalTo(70)
        }
        
        currencyRatesTextLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
        
        infoButton.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(currencyRatesView)
            make.width.equalTo(currencyRatesView.snp.height)
        }
        
        /*currencyPickerView.snp.makeConstraints { make in
            make.left.right.equalTo(view)
            make.top.equalTo(currencyRatesView.snp.bottom).offset(20)
            make.width.height.equalTo(50)
        }*/
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}