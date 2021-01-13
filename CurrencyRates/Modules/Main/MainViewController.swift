//
//  MainViewController.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class MainViewController: UIViewController {
    private var didSetupConstraints = false
    
    let intoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let outoView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let inputTextField: UITextField = {
        let inputTextField = UITextField()
        inputTextField.textColor = .blue
        return inputTextField
    }()
    
    let outputTextField: UITextField = {
        let outputTextField = UITextField()
        outputTextField.textColor = .white
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
