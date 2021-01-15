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
    
    let inputTextField: UITextField = {
        let inputTextField = UITextField()
        inputTextField.textColor = UIColor.appColor(.inputTextColor)
        inputTextField.font = UIFont.appFont(.bold, size: 60)
        return inputTextField
    }()
    
    let outputTextLabel = UILabel(text: DescriptionOfCurrencies.ShortName.USD,
                                  textColor: UIColor.appColor(.outputTextColor),
                                  font: UIFont.appFont(.bold, size: 60))
    
    let inputCurrencyButton = UIButton(title: DescriptionOfCurrencies.ShortName.USD,
                                       titleColor: UIColor.appColor(.inputTextColor),
                                       backgroundColor: UIColor.appColor(.mainSubViewOutputBackgroundColor),
                                       font: .none,
                                       isShadow: true,
                                       cornerRadius: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appColor(.mainViewBackgroundColor)
        view.addSubview(intoView)
        view.addSubview(outoView)
        intoView.addSubview(inputTextField)
        intoView.addSubview(inputCurrencyButton)
        outoView.addSubview(outputTextLabel)
        view.setNeedsUpdateConstraints()
        updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        
        if (!didSetupConstraints) {
            
            intoView.snp.makeConstraints { make in
                make.leading.top.trailing.equalTo(view).inset(20)
                make.height.equalTo(70)
            }
            
            outoView.snp.makeConstraints { make in
                make.leading.trailing.equalTo(view).inset(20)
                make.top.equalTo(intoView.snp.bottom).offset(20)
                make.height.equalTo(70)
            }
            
            inputTextField.snp.makeConstraints { make in
                make.leading.top.bottom.equalToSuperview().offset(5)
            }
            
            inputCurrencyButton.snp.makeConstraints { make in
                make.trailing.top.bottom.equalToSuperview()
                //make.top.equalTo(inputTextField.snp.bottom).offset(10)
                make.leading.equalTo(inputTextField.snp.trailing)
            }
            
            outputTextLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
}
