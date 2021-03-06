//
//  RouterMain.swift
//  CurrencyRates
//
//  Created by Rusell on 20.01.2021.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModuleBuilder: Builder {
    static func createMainModule() -> UIViewController {
        return UIViewController()
    }
}
