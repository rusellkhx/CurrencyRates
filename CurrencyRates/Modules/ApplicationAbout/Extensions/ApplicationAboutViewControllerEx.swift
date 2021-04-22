//
//  ApplicationAboutViewController.swift
//  CurrencyRates
//
//  Created by Rusell on 06.03.2021.
//

import UIKit
import SnapKit

extension ApplicationAboutViewController {
    internal func updateView() {
        view.backgroundColor = .white
        view.addSubview(urlButton)
        view.addSubview(infoTextLabel)
        view.addSubview(urlTextLabel)
        
        infoTextLabel.textAlignment = .center
        urlButton.addTarget(self, action: #selector(urlButtonClicked), for: .touchUpInside)
        
        navigationController?.navigationBar.barTintColor = UIColor.appColor(.navBarColor)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appColor(.white)]
        title = DescriptionOfViewMain.aboutViewNameTitle
    }
    
    internal func setupConstraints() {
        
        infoTextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(14)
        }
        
        urlTextLabel.snp.makeConstraints { make in
            make.top.equalTo(infoTextLabel).offset(20)
            make.centerXWithinMargins.equalTo(infoTextLabel)
            make.height.equalTo(14)
        }
        
        urlButton.snp.makeConstraints { make in
            make.bottom.equalTo(urlTextLabel).offset(30)
            make.centerXWithinMargins.equalTo(urlTextLabel)
            make.height.equalTo(14)
        }
    }
}
