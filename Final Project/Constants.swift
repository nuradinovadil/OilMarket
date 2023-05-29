//
//  Constants.swift
//  Final Project
//
//  Created by Nuradinov Adil on 14/03/23.
//

import Foundation

struct Constants {
    struct Identifiers {
        static var carouselCollectionViewCell = "CarouselCollectionViewCell"
        static var productCollectionViewCell = "ProductCollectionViewCell"
        static var settingsTableViewCell = "SettingsTableViewCell"
        static var contactUsTableViewCell = "ContactUsTableViewCell"
        static var cartTableViewCell = "CartTableViewCell"
        static var currencyTableViewCell = "CurrencyTableViewCell"
    }
    
    struct Values {
        static var carouselImage = ["carousel1", "carousel2", "carousel3"]
        static var settingsDictionary: [String:String] = ["gear":"Settings", "":"Billing", "questionmark.circle.fill":"Help", "":"Order History"]
    }
    
    struct API {
        static var apiKey = "PJfDL6s4D4xXkSbTIMNzJXaXqUam6GmU"
    }
    
    struct URL {
//        static var url = "https://api.apilayer.com/exchangerates_data/convert?to=KZT&from=USD&amount=1"
    }
}

enum Profile : String, CaseIterable {
    case settings = "Settings"
    case billing = "Billing"
    case help = "Help"
    case history = "Order History"
}

enum ProfieImages: String, CaseIterable {
    case settings = "gear"
    case billing = "creditcard.fill"
    case help = "questionmark.circle.fill"
    case history = "list.bullet.rectangle.portrait.fill"
}

