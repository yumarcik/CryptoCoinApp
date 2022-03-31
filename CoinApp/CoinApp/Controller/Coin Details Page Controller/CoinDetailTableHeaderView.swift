//
//  CoinDetailTableHeaderView.swift
//  CoinApp
//
//  Created by Yağmur Polat on 31.03.2022.
//

import UIKit

class CoinDetailTableHeaderView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var changeLbl: UILabel!
    @IBOutlet weak var highPriceLbl: UILabel!
    @IBOutlet weak var lowPriceLbl: UILabel!
    
    private var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(coin: Coin) {
        self.configureView()
        
        let seperatedPrice = "$" + String(format: "%.02f", Double(coin.price)!)
        let tempList = coin.sparkline.sorted {
            Double($0)! > Double($1)!
        }
        let highPrice = "$" + String(format: "%.02f", Double(tempList.first!)!)
        let lowPrice = "$" + String(format: "%.02f", Double(tempList.last!)!)
        
        if coin.change.first == "-" {
            changeLbl.text = coin.change + "%"
            changeLbl.textColor = .systemRed
        } else {
            let changeWithPlus = "+" + (coin.change) + "%"
            changeLbl.text = changeWithPlus
            changeLbl.textColor = .systemGreen
        }
        
        self.highPriceLbl.text = highPrice
        self.lowPriceLbl.text = lowPrice
        self.nameLbl.text = coin.name
        //self.changeLbl.text = coin.change
        self.priceLbl.text = seperatedPrice
    }
    
    private func configureView() {
        guard let nibView = loadViewFromNib() else {
            return
        }
        
        containerView = nibView
        
        bounds = nibView.frame
        addSubview(nibView)
    }
    
    
    
    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let name = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
        let nib = UINib(nibName: name, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.layer.cornerRadius = 6
        
        return view
    }
}
