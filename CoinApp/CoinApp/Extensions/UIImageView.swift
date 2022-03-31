//
//  UIImageView.swift
//  CoinApp
//
//  Created by Yağmur Polat on 23.03.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
    
}

