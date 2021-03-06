//
//  ApplicationAboutViewController.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.

import UIKit

class ApplicationAboutViewController: UIViewController, ApplicationAboutViewControllerProtocol {
    
    var presenter: ApplicationAboutPresenterProtocol?
    
    let urlButton = UIButton(title: "https://free.currencyconverterapi.com",
                             titleColor: .black)
    
    
    
    let outputTextLabel = UILabel(text: DescriptionOfCurrencies.ShortName.USD,
                                  textColor: UIColor.appColor(.outputTextColor),
                                  font: UIFont.appFont(.regular, size: 60))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        setupConstraints()
        presenter?.configureView()
    }
    
    func closeButtonClicked(_ sender: UIBarButtonItem) {
        presenter?.closeButtonPush()
    }
    
    @objc func urlButtonClicked(_ sender: UIButton) {
        presenter?.urlButtonPush(urlString: sender.currentTitle)
    }
    
    func setUrlButtonTitle(title: String?) {
        if let title = title {
            urlButton.setTitle(title, for: .normal)
        }
    }
    
}
