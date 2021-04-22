//
//  ApplicationAboutViewController.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.

import UIKit

class ApplicationAboutViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: ApplicationAboutPresenterProtocol?
    
    let urlButton = UIButton(
        title: DescriptionOfViewMain.linkURL,
        titleColor: UIColor.appColor(.linkURL)
    )
    
    let infoTextLabel = UILabel(
        text: DescriptionOfViewMain.labelAppNameTitle,
        textColor: UIColor.appColor(.defaultText),
        font: UIFont.appFont(.regular, size: 16)
    )
    
    let urlTextLabel = UILabel(text: DescriptionOfViewMain.linkURL,
                               textColor: UIColor.appColor(.defaultText),
                               font: UIFont.appFont(.regular, size: 16))
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        setupConstraints()
        presenter?.configureView()
    }
}

// MARK: - Extension ApplicationAboutViewControllerProtocol

extension ApplicationAboutViewController: ApplicationAboutViewControllerProtocol {
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
