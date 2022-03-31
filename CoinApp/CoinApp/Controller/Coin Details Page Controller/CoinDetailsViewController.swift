//
//  CoinDetailsViewController.swift
//  CoinApp
//
//  Created by Yağmur Polat on 31.03.2022.
//

import UIKit

class CoinDetailsViewController: UIViewController {
    
    
    var coin: Coin = Coin(uuid: "", symbol: "", name: "", color: "", iconURL: "", marketCap: "", price: "", listedAt: 0, tier: 0, change: "", rank: 0, sparkline: [], lowVolume: false, coinrankingURL: "", the24HVolume: "") /*= Coin(uuid: "iAzbfXiBBKkR6", symbol: "EOS", name: "EOS", color: "#443f54", iconURL: "https://cdn.coinranking.com/PqOYrWSje/eos2.svg", marketCap: "3793014346", price: "3.9471397861200392", listedAt: 1498694400, tier: 1, change: "-3.61", rank: 49, sparkline: [], lowVolume: false, coinrankingURL: "https://coinranking.com/coin/iAzbfXiBBKkR6+eos-eos", the24HVolume: "455991657")*/


    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.topItem?.title = coin.symbol
        
        tableView.register(UINib(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension CoinDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coin.sparkline.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailCell
        
        let newDetail = "$" + String(format: "%.02f", Double(coin.sparkline[indexPath.row])!)
        cell.details.text = newDetail
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CoinDetailTableHeaderView()
        header.setup(coin: coin)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
}
