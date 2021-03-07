//
//  ApplicationAboutViewController.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.

import UIKit

class ApplicationAboutViewController: UIViewController, ApplicationAboutViewControllerProtocol {
    
    var presenter: ApplicationAboutPresenterProtocol?
    
    let urlButton = UIButton(title: DescriptionOfViewMain.linkURL,
                             titleColor: UIColor.appColor(.linkURL))
    
    let infoTextLabel = UILabel(text: DescriptionOfViewMain.labelAppNameTitle,
                                textColor: UIColor.appColor(.defaultText),
                                  font: UIFont.appFont(.regular, size: 16))
    
    let urlTextLabel = UILabel(text: DescriptionOfViewMain.linkURL,
                               textColor: UIColor.appColor(.defaultText),
                                  font: UIFont.appFont(.regular, size: 16))
    
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
