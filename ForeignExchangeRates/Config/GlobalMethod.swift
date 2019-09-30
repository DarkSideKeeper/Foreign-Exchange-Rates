//
//  GlobalMethod.swift
//  ForeignExchangeRates
//
//  Created by Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//

import UIKit

typealias GBM = GlobalMethod

class GlobalMethod {
    static let shared = GlobalMethod()
    
    func setLanguage(language: AppLanguage) {
        UserDefaults.standard.set(language.rawValue, forKey: "i18n_language")
        UserDefaults.standard.synchronize()
    }
    
    func getLanguage() -> AppLanguage {
        guard let currentLanguage = UserDefaults.standard.object(forKey: "i18n_language") as? String else {
            return .en
        }
        return AppLanguage(rawValue: currentLanguage) ?? .en
    }
}
