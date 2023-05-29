//
//  CurrencyData.swift
//  Final Project
//
//  Created by Nuradinov Adil on 03/04/23.
//

import Foundation

struct CurrencyData: Codable {
    let query : Query
    struct Query: Codable {
        let from: String
        let to: String
        let amount: Int
    }
    let info: Info
    struct Info: Codable {
        let rate: Double
        let timestamp: Int
    }
}
