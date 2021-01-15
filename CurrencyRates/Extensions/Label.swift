//
//  Label.swift
//  CurrencyRates
//
//  Created by Rusell on 15.01.2021.
//

import UIKit

extension UILabel {
    
    convenience init(text: String,
                     textColor: UIColor,
                     font: UIFont? = .none) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}
