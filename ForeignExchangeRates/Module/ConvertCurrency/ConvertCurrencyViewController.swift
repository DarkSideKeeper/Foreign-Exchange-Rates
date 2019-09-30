//
//  ConvertCurrencyViewController.swift
//  ForeignExchangeRates
//
//  Created Titipan Sakunwongsalee on 17/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ConvertCurrencyViewController: UIViewController, ConvertCurrencyViewProtocol {

	var presenter: ConvertCurrencyPresenterProtocol?
    
    @IBOutlet var pickerCurrentCurrency: UIPickerView!
    @IBOutlet var pickerToCurrency: UIPickerView!
    @IBOutlet var textFieldAmount: UITextField!
    
    private var currentCurrencyValue: ExchangeRatesModel!
    private var toCurrencyValue: ExchangeRatesModel!
    
	override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        pickerCurrentCurrency.delegate = self
        pickerCurrentCurrency.dataSource = self
        pickerToCurrency.delegate = self
        pickerToCurrency.dataSource = self
        
        currentCurrencyValue = presenter?.getRate(index: 0)
        toCurrencyValue = presenter?.getRate(index: 0)
    }
    
    @IBAction func clickBtnCalculate(_ sender: Any) {
        guard let currentName = currentCurrencyValue.family,
            let toName = toCurrencyValue.family,
            let currentBuy = Double(currentCurrencyValue.buyingRates ?? ""),
            let toBuy = Double(toCurrencyValue.buyingRates ?? ""),
            let amount = Double(textFieldAmount.text ?? "") else {
                showAlertResult(title: "Error", message: "No Data")
            return
        }
        let agv = Double(currentBuy) / Double(toBuy)
        let result = amount * agv
        let title = String(format: "%.02f \(toName)", result)
        let message = String(format: "1 \(currentName) -> %.02f \(toName)", agv)
        showAlertResult(title: title, message: message)
    }
    
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlertResult(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                break
            case .destructive:
                break
            @unknown default:
                break
            }}))
        present(alert, animated: true, completion: nil)
    }
}

extension ConvertCurrencyViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter?.getListRate().count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let list = presenter?.getListRate() else { return nil }
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerCurrentCurrency {
            currentCurrencyValue = presenter?.getRate(index: row)
        } else {
            toCurrencyValue = presenter?.getRate(index: row)
        }
    }
}
