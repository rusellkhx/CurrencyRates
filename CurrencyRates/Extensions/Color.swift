//
//  UIColor.swift
//  CurrencyRates
//
//  Created by Rusell on 15.01.2021.
//

import UIKit

extension UIColor {
    
    enum AssetsColor: String {
        case inputTextColor
        case outputTextColor
        case mainViewBackgroundColor
        case mainSubViewInputBackgroundColor
        case mainSubViewOutputBackgroundColor
        case mainSuvViewCurrencyRates
        case defaultText
        case pickerTitleTextColor
        case pickerViewColor
        case navBarColor
        case white
        case linkURL
    }
    
    static func appColor(_ name: AssetsColor) -> UIColor {
        
        guard let color = UIColor(named: name.rawValue) else {
            print("Error: color \(name.rawValue) not found")
            return .red
        }
        
        return color
    }
}
