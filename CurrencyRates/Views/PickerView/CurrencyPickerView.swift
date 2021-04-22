//
//  CurrencyPickerView.swift
//  CurrencyRates
//
//  Created by Rusell on 23.01.2021.
//

import UIKit

protocol CurrencyPickerViewProtocol: class {
    var arrayCurrencyNames: [String] { set get }
    var title: String { set get }
    var selectedCurrencyIndex: Int? { set get }
    func reload()
}

protocol CurrencyPickerViewDelegate {
    func currencyPickerViewCancelButtonClicked()
    func currencyPickerViewApplyButtonClicked(selectedRow: Int)
}

class CurrencyPickerView: UIView, CurrencyPickerViewProtocol {
    
    // MARK: - Public properties
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor(.pickerViewColor)
        return view
    }()
    
    let pickerView: UIPickerView = {
        let view = UIPickerView()
        view.backgroundColor = UIColor.appColor(.pickerViewColor)
        return view
    }()
    
    let titleLabel = UILabel(text: DescriptionOfViewMain.inputCurrencyPickerViewTitle,
                             textColor: UIColor.appColor(.pickerTitleTextColor),
                             font: UIFont.appFont(.regular, size: 14))
    
    let cancelButton: UIButton = {
        let cancelButton = UIButton(title: DescriptionOfButton.cancel,
                                    titleColor: UIColor.appColor(.pickerTitleTextColor),
                                    backgroundColor: UIColor.appColor(.pickerViewColor),
                                    font: UIFont.appFont(.regular, size: 16),
                                    isShadow: false,
                                    cornerRadius: 10)
        
        return cancelButton
    }()
    
    let aplyButton: UIButton = {
        let aplyButton = UIButton(title: DescriptionOfButton.aply,
                                  titleColor: UIColor.appColor(.pickerTitleTextColor),
                                  backgroundColor: UIColor.appColor(.pickerViewColor),
                                  font: UIFont.appFont(.regular, size: 16),
                                  isShadow: false,
                                  cornerRadius: 10)
        return aplyButton
    }()
    
    // MARK: - Delegates
    
    var delegate: CurrencyPickerViewDelegate?
    
    // MARK: - Private properties
    
    private let numberOfComponents = 1
    private let componentIndex = 0
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    // MARK: - Private methods
    
    private func setupUI() {
        cancelButton.addTarget(
            self,
            action: #selector(cancelButtonClicked),
            for: .touchUpInside
        )
        
        aplyButton.addTarget(
            self,
            action: #selector(applyButtonClicked),
            for: .touchUpInside
        )
        
        addSubview(view)
        addSubview(pickerView)
        view.addSubview(titleLabel)
        view.addSubview(cancelButton)
        view.addSubview(aplyButton)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        view.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(44)
        }
        
        pickerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.snp.bottom)
            make.width.equalTo(375)
            make.height.equalTo(165)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }
        
        aplyButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(5)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
    
// MARK: - CurrencyPickerViewProtocol
    
    var arrayCurrencyNames = [String]()
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    func reload() {
        pickerView.reloadAllComponents()
    }
    
    var selectedCurrencyIndex: Int? {
        didSet {
            pickerView.selectRow(selectedCurrencyIndex!, inComponent: componentIndex, animated: false)
        }
    }
}

// MARK: - UIPickerView dataSource methods

extension CurrencyPickerView: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayCurrencyNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayCurrencyNames[row]
    }
}
// MARK: - Extension UIPickerViewDataSource

extension CurrencyPickerView: UIPickerViewDataSource {
    @objc func cancelButtonClicked(_ sender: UIButton) {
        delegate?.currencyPickerViewCancelButtonClicked()
    }
    
    @objc func applyButtonClicked(_ sender: UIButton) {
        delegate?.currencyPickerViewApplyButtonClicked(selectedRow: pickerView.selectedRow(inComponent: componentIndex))
    }
}
