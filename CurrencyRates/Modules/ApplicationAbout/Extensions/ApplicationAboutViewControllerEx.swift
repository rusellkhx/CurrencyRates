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
        urlButton.addTarget(self, action: #selector(urlButtonClicked), for: .touchUpInside)
        navigationController?.navigationBar.barTintColor = UIColor.appColor(.navBarColor)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appColor(.white)]
        title = DescriptionOfView.aboutViewNameTitle
    }
    
    internal func setupConstraints() {
        urlButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(10)
        }
    }
}


