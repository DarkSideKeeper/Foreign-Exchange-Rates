//
//  Constants.swift
//  ForeignExchangeRates
//
//  Created by Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//

struct AppUrl {
    private struct Domains {
        static let Dev = "https://www.bangkokbank.com"
        static let UAT = "https://www.bangkokbank.com"
        static let Prod = "https://www.bangkokbank.com"
    }
    
    private  struct Routes {
        static let Api = "/api"
    }
    
    private  static let Domain = Domains.Dev
    private  static let Route = Routes.Api
    private  static let BaseURL = Domain + Route
    
    static var ExchangeRateService: String {
        return BaseURL  + "/exchangerateservice/Getfxrates/%@/%@/%@/1/th"
    }
}
