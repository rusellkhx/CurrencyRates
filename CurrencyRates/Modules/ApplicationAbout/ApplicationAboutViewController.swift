//
//  ApplicationAboutViewController.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit

class ApplicationAboutViewController: UIViewController, ApplicationAboutViewControllerProtocol {
    
    var presenter: ApplicationAboutPresenterProtocol!
    let configurator: ApplicationAboutConfiguratorProtocol = ApplicationAboutConfigurator()
    
    @IBOutlet weak var urlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        
    }
    
    @IBAction func closeButtonClicked(_ sender: UIBarButtonItem) {
        presenter.closeButtonPush()
    }
    
    @IBAction func urlButtonClicked(_ sender: UIButton) {
        presenter.urlButtonPush(urlString: sender.currentTitle)
    }
    
    func setUrlButtonTitle(title: String) {
        urlButton.setTitle(title, for: .normal)
    }
    
}
