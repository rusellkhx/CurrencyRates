//
//  MainConfigurator.swift
//  CurrencyRates
//
//  Created by Rusell on 20.01.2021.
//

class MainConfigurator: MainConfiguratorProtocol {
    static func configure() -> MainViewController {
        let view = MainViewController()
        let router = MainRouter(viewController: view)
        
        let interactor = MainInteractor(currencyService: CurrencyService(),
                                        networkService: NetworkService())
        
        let presenter = MainPresenter(view: view,
                                      interactor: interactor,
                                      router: router)
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        presenter.currencyPickerView = view.currencyPickerView
        view.currencyPickerView.delegate = presenter
        return view
    }
}
