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
        inputTextField.minimumFontSize = 20
        inputTextField.adjustsFontSizeToFitWidth = true
        inputTextField.clearButtonMode = .whileEditing
        inputTextField.keyboardType = .decimalPad
        return inputTextField
    }()
    
    let outputTextLabel = UILabel(text: DescriptionOfCurrencies.ShortName.USD,
                                  textColor: UIColor.appColor(.outputTextColor),
                                  font: UIFont.appFont(.bold, size: 60))
    
    let inputCurrencyButton = UIButton(title: DescriptionOfCurrencies.ShortName.USD,
                                       titleColor: UIColor.appColor(.outputTextColor),
                                       backgroundColor: UIColor.appColor(.mainSubViewOutputBackgroundColor),
                                       font: UIFont.appFont(.bold, size: 30),
                                       isShadow: false,
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
                make.top.equalTo(view).inset(20)
                make.left.top.right.equalTo(view).inset(20)
                make.height.equalTo(70)
            }
            
            outoView.snp.makeConstraints { make in
                make.left.right.equalTo(view).inset(20)
                make.top.equalTo(intoView.snp.bottom).offset(20)
                make.height.equalTo(70)
            }
            
            inputTextField.snp.makeConstraints { make in
                make.left.equalTo(intoView).inset(5)
                make.top.bottom.equalTo(intoView)
                //make.right.equalTo(inputCurrencyButton.snp.left)
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
                make.edges.equalToSuperview()
            }
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
}
