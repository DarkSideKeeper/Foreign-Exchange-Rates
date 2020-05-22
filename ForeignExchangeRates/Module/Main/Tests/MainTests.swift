//
//  MainTests.swift
//  ForeignExchangeRatesTests
//
//  Created by Titipan Sakunwongsalee on 21/5/2563 BE.
//  Copyright © 2563 Titipan Sakunwongsalee. All rights reserved.
//

import XCTest
@testable import ForeignExchangeRates

class MainTests: XCTestCase {
    
    var viewController: MainViewController? = nil
    var presenter: DummyMainPresenter? = nil
    
    override func setUp() {
        viewController = DummyMainRouter.createModule() as? MainViewController
        presenter = DummyMainPresenter(interface: viewController!, interactor: viewController?.presenter?.interactor, router: MainRouter())
        viewController?.presenter = presenter
    }
    
    func test_ChangeLanguage() {
        let currentLanguage = GBM.shared.getLanguage()
        print("Current Language: \(currentLanguage)")
        viewController?.clickChangeLanguage(UIButton())
        XCTAssertNotEqual(currentLanguage, GBM.shared.getLanguage())
    }
    
    func test_CalledGetExchangeRates() {
        viewController?.presenter?.getExchangeRates()
        XCTAssertTrue(presenter?.isCalledGetExchangeRates ?? false)
    }
}

class DummyMainRouter: MainWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = DummyMainView(nibName: nil, bundle: nil)
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    
    func goToConvertView(model: [ExchangeRatesModel]) {
        let vc = ConvertCurrencyRouter.createModule(model: model)
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = true
        nav.modalPresentationStyle = .overFullScreen
        viewController?.present(nav, animated: true, completion: nil)
    }
}

class DummyMainView: MainViewController {
    override func clickChangeLanguage(_ sender: UIButton) {
        if GBM.shared.getLanguage() == .en {
            GBM.shared.setLanguage(language: .th)
        } else {
            GBM.shared.setLanguage(language: .en)
        }
    }
}

class DummyMainPresenter: MainPresenterProtocol, MainInteractorOutputProtocol {
    weak private var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    private let router: MainWireframeProtocol
    
    init(interface: MainViewProtocol, interactor: MainInteractorInputProtocol?, router: MainWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func showConvertView(model: [ExchangeRatesModel]) {
        
    }
    
    var isCalledGetExchangeRates = false
    func getExchangeRates() {
        isCalledGetExchangeRates = true
        interactor?.callApiExchangeRates()
    }
    
    func callApiExchangeRatesSuccess(model: [ExchangeRatesModel]) {
        view?.showListExchangeRates(model: model)
    }
}
