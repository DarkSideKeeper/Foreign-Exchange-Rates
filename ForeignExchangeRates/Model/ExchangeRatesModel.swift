//
//  ExchangeRatesModel.swift
//  ForeignExchangeRates
//
//  Created by Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//

import UIKit

struct ExchangeRatesModel : Codable {
    let iD : String?
    let description : String?
    let family : String?
    let familyLong : String?
    let buyingRates : String?
    let sellingRates : String?
    let sightBill : String?
    let bill_DD_TT : String?
    let tT : String?
    let ddate : String?
    let update : String?
    let dTime : String?
    
    enum CodingKeys: String, CodingKey {
        case iD = "ID"
        case description = "Description"
        case family = "Family"
        case familyLong = "FamilyLong"
        case buyingRates = "BuyingRates"
        case sellingRates = "SellingRates"
        case sightBill = "SightBill"
        case bill_DD_TT = "Bill_DD_TT"
        case tT = "TT"
        case ddate = "Ddate"
        case update = "Update"
        case dTime = "DTime"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iD = try values.decodeIfPresent(String.self, forKey: .iD)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        family = try values.decodeIfPresent(String.self, forKey: .family)?.trimmingCharacters(in: .whitespaces)
        familyLong = try values.decodeIfPresent(String.self, forKey: .familyLong)
        buyingRates = try values.decodeIfPresent(String.self, forKey: .buyingRates)?.trimmingCharacters(in: .whitespaces)
        sellingRates = try values.decodeIfPresent(String.self, forKey: .sellingRates)?.trimmingCharacters(in: .whitespaces)
        sightBill = try values.decodeIfPresent(String.self, forKey: .sightBill)
        bill_DD_TT = try values.decodeIfPresent(String.self, forKey: .bill_DD_TT)
        tT = try values.decodeIfPresent(String.self, forKey: .tT)
        ddate = try values.decodeIfPresent(String.self, forKey: .ddate)
        update = try values.decodeIfPresent(String.self, forKey: .update)
        dTime = try values.decodeIfPresent(String.self, forKey: .dTime)
    }
    
}
