//
//  CoinCell.swift
//  CoinApp
//
//  Created by Yağmur Polat on 18.03.2022.
//

import UIKit
import Kingfisher

class CoinCell: UICollectionViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var change: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(with coin: Coin) {
        if coin.change.first == "-" {
            change.text = coin.change + "%"
            change.textColor = .systemRed
        } else {
            let changeWithPlus = "+" + (coin.change) + "%"
            change.text = changeWithPlus
            change.textColor = .systemGreen
        }
        let seperatedPrice = "$" + String(format: "%.02f", Double(coin.price)!)
        let newUrl = coin.iconURL.replacingOccurrences(of: ".svg", with: ".png")
        let url = URL(string: newUrl)
        icon.kf.setImage(with: url)
        symbol.text = coin.symbol
        name.text = coin.name
        price.text = seperatedPrice
        print(coin.iconURL)
    }

}
