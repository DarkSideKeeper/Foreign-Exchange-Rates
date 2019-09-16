//
//  Constants.swift
//  ForeignExchangeRates
//
//  Created by Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//

struct AppService {
    private struct Domains {
        static let Dev = "https://www.bangkokbank.com"
    }
    
    private  struct Routes {
        static let Api = "/api"
    }
    
    private  static let Domain = Domains.Dev
    private  static let Route = Routes.Api
    private  static let BaseURL = Domain + Route
    
    struct ExchangeRate {
        var day: String
        var Month: String
        var year: String
        
        var url: String {
            return BaseURL + "/exchangerateservice/Getfxrates/\(day)/\(Month)/\(year)/1/\(GBM.shared.getLanguage())"
        }
    }
}

enum AppLanguage: String {
    case th
    case en
}
