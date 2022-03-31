//
//  Double.swift
//  CoinApp
//
//  Created by Yağmur Polat on 29.03.2022.
//

import Foundation

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
