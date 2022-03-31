//
//  DetailCell.swift
//  CoinApp
//
//  Created by Yağmur Polat on 31.03.2022.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var details: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
