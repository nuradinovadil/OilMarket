//
//  CurrencyModel.swift
//  Final Project
//
//  Created by Nuradinov Adil on 03/04/23.
//

import Foundation

struct CurrencyModel {
    let currencyFrom: String
    let currencyTo: String
    let rate: Double
    
    var rateString: String {
        return String(format: "%.2f", rate)
    }
}
