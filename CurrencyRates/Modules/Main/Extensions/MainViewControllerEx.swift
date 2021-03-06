//
//  Extension.swift
//  CurrencyRates
//
//  Created by Rusell on 06.03.2021.
//

import UIKit

extension MainViewController {
    
    internal func updateView() {
        view.backgroundColor = UIColor.appColor(.mainViewBackgroundColor)
        view.addSubview(intoView)
        view.addSubview(outoView)
        view.addSubview(currencyRatesView)
        view.addSubview(currencyPickerView)
        
        intoView.addSubview(inputTextField)
        intoView.addSubview(inputCurrencyButton)
        outoView.addSubview(outputTextLabel)
        outoView.addSubview(outputCurrencyButton)
        currencyRatesView.addSubview(currencyRatesTextLabel)
        currencyRatesView.addSubview(infoButton)
        
        setupConstraints()
    }

    internal func setupConstraints() {
        intoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(70)
            make.centerX.equalTo(view)
        }
        
        outoView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(intoView.snp.bottom).offset(5)
            make.height.equalTo(70)
        }
        
        currencyRatesView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
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
            make.centerX.centerY.equalToSuperview()
        }
        
        infoButton.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(currencyRatesView)
            make.width.equalTo(currencyRatesView.snp.height)
        }
        
        currencyPickerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(currencyRatesView.snp.bottom).offset(20)
            make.width.height.equalTo(50)
        }
    }
}


