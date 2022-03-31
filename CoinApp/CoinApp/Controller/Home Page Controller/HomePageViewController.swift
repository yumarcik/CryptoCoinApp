//
//  HomePageViewController.swift
//  CoinApp
//
//  Created by Yağmur Polat on 18.03.2022.
//

import UIKit

class HomePageViewController: UIViewController {
    
    var coins = [Coin]() {
        didSet {
            DispatchQueue.main.async {
                self.coinCollectionView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var rankingList: UILabel!
    @IBOutlet weak var dropDown: DropDown!
    @IBOutlet weak var coinCollectionView: UICollectionView!
    
    let coinRequest = CoinRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // MARK: Network call
        coinRequest.getCoin { result in
            switch result {
            case .success(let coins):
                self.coins = coins.data.coins
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        // MARK: set collection view
        coinCollectionView.delegate = self
        coinCollectionView.dataSource = self
        // Do any additional setup after loading the view.
        self.coinCollectionView!.register(UINib(nibName: "CoinCell", bundle: nil), forCellWithReuseIdentifier: "coinCell")
        
        dropDown.optionArray = ["Price", "Market Cap", "24h Vol", "Change", "Listed At"]
        dropDown.text = "Filter"
        dropDown.didSelect { [self] selectedText, index, id in
            print(selectedText)
            switch index {
            case 0:
                coins.sort {
                    Double($0.price)! > Double($1.price)!
                }
            case 1:
                coins.sort {
                    Double($0.marketCap)! > Double($1.marketCap)!
                }
            case 2:
                coins.sort {
                    Double($0.the24HVolume)! > Double($1.the24HVolume)!
                }
            case 3:
                coins.sort {
                    Double($0.change)! > Double($1.change)!
                }
            case 4:
                coins.sort {
                    $0.listedAt! > $1.listedAt!
                }
            default:
                coins.sort {
                    Double($0.price)! > Double($1.price)!
                }
            }
        }
        
    }
    
    
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = coinCollectionView.dequeueReusableCell(withReuseIdentifier: "coinCell", for: indexPath) as! CoinCell
        
        cell.configureCell(with: coins[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CoinDetailsViewController()
        vc.coin = coins[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
