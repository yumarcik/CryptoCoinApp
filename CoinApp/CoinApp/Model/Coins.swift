//
//  CoinModel.swift
//  CoinApp
//
//  Created by Yağmur Polat on 18.03.2022.
//

import Foundation

struct Coins: Decodable {
    let status: String?
    let data: DataClass
}

struct DataClass: Decodable {
    let stats: Stats?
    let coins: [Coin]
}

struct Coin: Decodable {
    let uuid, symbol, name: String
    let color: String?
    let iconURL: String
    let marketCap, price: String
    let listedAt, tier: Int?
    let change: String
    let rank: Int?
    let sparkline: [String]
    let lowVolume: Bool?
    let coinrankingURL: String?
    let the24HVolume: String

    enum CodingKeys: String, CodingKey {
        case uuid, symbol, name, color
        case iconURL = "iconUrl"
        case marketCap, price, listedAt, tier, change, rank, sparkline, lowVolume
        case coinrankingURL = "coinrankingUrl"
        case the24HVolume = "24hVolume"
    }
}

struct Stats: Decodable {
    let total, totalCoins, totalMarkets, totalExchanges: Int?
    let totalMarketCap, total24HVolume: String?

    enum CodingKeys: String, CodingKey {
        case total, totalCoins, totalMarkets, totalExchanges, totalMarketCap
        case total24HVolume = "total24hVolume"
    }
}
