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
        inputTextField.font = UIFont.appFont(.bold)
        return inputTextField
    }()
    
    let outputTextField: UITextField = {
        let outputTextField = UITextField()
        outputTextField.textColor = UIColor.appColor(.outputTextColor)
        outputTextField.font = UIFont.appFont(.bold)
        return outputTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBlue
        view.addSubview(intoView)
        view.addSubview(outoView)
        intoView.addSubview(inputTextField)
        outoView.addSubview(outputTextField)
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
                make.edges.equalToSuperview()
            }
            
            outputTextField.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
}
