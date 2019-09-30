//
//  ExchangeRateCell.swift
//  ForeignExchangeRates
//
//  Created by Titipan Sakunwongsalee on 16/9/2562 BE.
//  Copyright © 2562 Titipan Sakunwongsalee. All rights reserved.
//

import UIKit

class ExchangeRateCell: UITableViewCell {
    
    static let nibName = "ExchangeRateCell"
    static let identifier = "Cell"
    
    @IBOutlet var imageIcon: UIImageView!
    @IBOutlet var lbName: UILabel!
    @IBOutlet var lbBuyPrice: UILabel!
    @IBOutlet var lbSellPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(model: ExchangeRatesModel) {
        imageIcon.image = UIImage(named: model.family ?? "icon_flag")
        lbName.text = model.family
        lbBuyPrice.text = model.buyingRates
        lbSellPrice.text = model.sellingRates
    }
}
