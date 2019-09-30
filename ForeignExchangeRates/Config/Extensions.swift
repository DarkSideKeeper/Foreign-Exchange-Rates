//
//  Extensions.swift
//  ForeignExchangeRates
//
//  Created by Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//

import UIKit

extension String {
    var localized: String {
        if let _ = UserDefaults.standard.string(forKey: "i18n_language") {} else {
            UserDefaults.standard.set("en", forKey: "i18n_language")
            UserDefaults.standard.synchronize()
        }
        
        let lang = UserDefaults.standard.string(forKey: "i18n_language")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
