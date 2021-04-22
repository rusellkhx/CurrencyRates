//
//  MainViewController.swift
//  CurrencyRates
//
//  Created by Rusell on 03.01.2021.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, MainViewControllerProtocol, UITextFieldDelegate {
   
    // MARK: - Public properties
    
    var presenter: MainPresenterProtocol?
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    let currencyPickerView: CurrencyPickerView = {
        let view = CurrencyPickerView()
        return view
    }()
    
    // MARK: - Private properties

    private var offsetBottomCurrencyPickerView: CGFloat = 206
    
    private let intoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.mainSubViewInputBackgroundColor)
        return view
    }()
    
    private let outoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.mainSubViewOutputBackgroundColor)
        return view
    }()
    
    private let currencyRatesView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.mainSuvViewCurrencyRates)
        return view
    }()
    
    // MARK: - intoView
    
    private let inputTextField: UITextField = {
        let inputTextField = UITextField()
        inputTextField.textColor = UIColor.appColor(.inputTextColor)
        inputTextField.font = UIFont.appFont(.regular, size: 60)
        inputTextField.minimumFontSize = 20
        inputTextField.adjustsFontSizeToFitWidth = true
        inputTextField.clearButtonMode = .whileEditing
        inputTextField.keyboardType = .decimalPad
        return inputTextField
    }()
    
    private let inputCurrencyButton = UIButton(title: DescriptionOfCurrencies.ShortName.USD,
                                       titleColor: UIColor.appColor(.inputTextColor),
                                       backgroundColor: UIColor.appColor(.mainSubViewInputBackgroundColor),
                                       font: UIFont.appFont(.regular, size: 30),
                                       isShadow: false)
    
    // MARK: outoView
    private let outputTextLabel = UILabel(text: DescriptionOfCurrencies.ShortName.USD,
                                  textColor: UIColor.appColor(.outputTextColor),
                                  font: UIFont.appFont(.regular, size: 60))
    
    private let outputCurrencyButton = UIButton(title: DescriptionOfCurrencies.ShortName.EUR,
                                        titleColor: UIColor.appColor(.outputTextColor),
                                        backgroundColor: UIColor.appColor(.mainSubViewOutputBackgroundColor),
                                        font: UIFont.appFont(.regular, size: 30),
                                        isShadow: false)
    
    // MARK: currencyRatesView
    private let currencyRatesTextLabel = UILabel(text: DescriptionOfCurrencies.defaultName.defaultCurrencyRates,
                                         textColor: UIColor.appColor(.defaultText),
                                         font: UIFont.appFont(.bold, size: 14))
    
    private let infoButton: UIButton = {
        let infoButton = UIButton()
        infoButton.setImage(UIImage(systemName: DescriptionOfCurrencies.systemImageName.info),
                            for: .normal)
        infoButton.tintColor = UIColor.appColor(.defaultText)
        return infoButton
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
        infoButton.addTarget(self, action: #selector(open), for: .touchUpInside)
        updateView()
        setupConstraints()
        presenter?.configureView()
    }
    
    // MARK: - Public methods
    
    @objc func open() {
        let vc = UINavigationController.init(rootViewController: ApplicationAboutConfigurator.configure())
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: - TextField delegate methods
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        presenter?.textFieldDidBeginEditing()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == inputTextField {
            if textField.availableAdding(string: string) {
                textField.addString(string)
                self.presenter?.inputValueChanged(to: textField.text ?? "")
            }
            return false
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField == inputTextField {
            textField.clear()
            self.presenter?.inputValueCleared()
            return false
        }
        return true
    }
        

// MARK: - Extension MainViewProtocol
    
    func setInputValue(with value: String?) {
        DispatchQueue.main.async {
            self.inputTextField.text = value
        }
    }
    
    func setOutputValue(with value: String?) {
        DispatchQueue.main.async {
            self.outputTextLabel.text = value
        }
    }
    
    func setInputCurrencyShortName(with shortName: String) {
        DispatchQueue.main.async {
            self.inputCurrencyButton.setTitle(shortName, for: .normal)
        }
    }
    
    func setOutputCurrencyShortName(with shortName: String) {
        DispatchQueue.main.async {
            self.outputCurrencyButton.setTitle(shortName, for: .normal)
        }
    }
    
    func addDoneOnInputCurrencyKeyboard() {
        inputTextField.addDoneOnKeyboard()
    }
    
    func showAlertView(with text: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "", message: text, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                
            })
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showPickerView() {
        UIView.animate(withDuration: 0.5) {
            self.offsetBottomCurrencyPickerView = 0
            self.updateConstarintsLoadPickerView()
            self.view.layoutIfNeeded()
        }
    }
    
    func hidePickerView() {
        UIView.animate(withDuration: 0.5) {
            self.offsetBottomCurrencyPickerView = 206
            self.updateConstarintsHidePickerView()
            self.view.layoutIfNeeded()
        }
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    func setRateText(with rateText: String) {
        DispatchQueue.main.async {
            self.currencyRatesTextLabel.text = rateText
        }
    }
}

// MARK: - Extension MainViewController

extension MainViewController {
    
    private func updateView() {
        view.backgroundColor = UIColor.appColor(.mainViewBackgroundColor)
        
        outputTextLabel.adjustsFontSizeToFitWidth = true
        outputTextLabel.minimumScaleFactor = 0.5
        
        view.addSubview(intoView)
        view.addSubview(outoView)
        view.addSubview(currencyRatesView)
        view.addSubview(currencyPickerView)
        
        intoView.addSubview(inputTextField)
        intoView.addSubview(inputCurrencyButton)
        outoView.addSubview(outputTextLabel)
        outoView.addSubview(outputCurrencyButton)
        currencyRatesView.addSubview(currencyRatesTextLabel)
        currencyRatesView.addSubview(infoButton)
        
        inputCurrencyButton.addTarget(
            self,
            action: #selector(inputCurrencyButtonClicked),
            for: .touchUpInside
        )
        
        outputCurrencyButton.addTarget(
            self,
            action: #selector(outputCurrencyButtonClicked),
            for: .touchUpInside
        )
        
        setupConstraints()
    }
    
    @objc private func inputCurrencyButtonClicked(_ sender: UIButton) {
        presenter?.inputCurrencyButtonClicked()
    }
    
    @objc private func outputCurrencyButtonClicked(_ sender: UIButton) {
        presenter?.outputCurrencyButtonClicked()
    }
    
    private func setupConstraints() {
        intoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(70)
            make.centerX.equalTo(view)
        }
        
        outoView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            make.top.equalTo(intoView.snp.bottom).offset(5)
            make.height.equalTo(70)
        }
        
        currencyRatesView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(outoView.snp.bottom).offset(20)
            make.height.equalTo(28)
        }
        
        inputTextField.snp.makeConstraints { make in
            make.left.equalTo(intoView).inset(5)
            make.top.bottom.equalTo(intoView)
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
            make.left.equalTo(outoView).inset(5)
            make.top.bottom.equalTo(outoView)
            make.right.equalTo(outputCurrencyButton.snp.left)
            make.width.equalTo(200)
            make.height.equalTo(70)
        }
        
        outputCurrencyButton.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(outoView)
            make.left.equalTo(outputTextLabel.snp.right)
            make.width.height.equalTo(70)
        }
        
        currencyRatesTextLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        infoButton.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(currencyRatesView)
            make.width.equalTo(currencyRatesView.snp.height)
        }
        
        currencyPickerView.snp.makeConstraints { make in
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(offsetBottomCurrencyPickerView)
            make.height.equalTo(206)
        }
    }
    
    
    // MARK: - Private methods
    
    private func updateConstarintsLoadPickerView() {
        currencyPickerView.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(offsetBottomCurrencyPickerView)
        }
    }
    
    private func updateConstarintsHidePickerView() {
        currencyPickerView.snp.updateConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(offsetBottomCurrencyPickerView)
        }
    }
}
