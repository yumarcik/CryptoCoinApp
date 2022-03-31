//
//  CoinRequest.swift
//  CoinApp
//
//  Created by Yağmur Polat on 18.03.2022.
//

import Foundation

enum CoinError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct CoinRequest {
    
    let resourceURL: URL
    
    init() {
        let resourceString = "https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy/coins"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError("Error")
        }
        self.resourceURL = resourceURL
    }
    
    func getCoin(completion: @escaping(Result<Coins, CoinError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let coins = try decoder.decode(Coins.self, from: jsonData)
                completion(.success(coins))
            } catch {
                completion(.failure(.canNotProcessData))
            }
        }
        
        dataTask.resume()
    
    }
    
}
