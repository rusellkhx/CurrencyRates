//
//  Button.swift
//  CurrencyRates
//
//  Created by Rusell on 15.01.2021.
//

import UIKit

extension UIButton {
    
    convenience init(title: String?,
                     titleColor: UIColor) {
        
        self.init(type: .system)
        
        self.setTitle(title ?? "", for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        
    }
    
    convenience init(title: String?,
                     titleColor: UIColor,
                     backgroundColor: UIColor,
                     font: UIFont? = .none,
                     isShadow: Bool = false,
                     cornerRadius: CGFloat = 4) {
        self.init(type: .system)
        self.setTitle(title ?? "", for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
}
