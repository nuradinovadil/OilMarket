//
//  APICaller.swift
//  Final Project
//
//  Created by Nuradinov Adil on 19/03/23.
//

import Foundation
import Alamofire

protocol APICallerDelegate {
    func didUpdateCurrencyModelList(with modelList: CurrencyModel, _ currencyRunner: APICaller)
    func didFailWithError(with error: Error)
}

struct APICaller {

    static var shared = APICaller()
    
    var delegate: APICallerDelegate?

    func fetchRequest(from currencyName: String) {
        let apiKey = "PJfDL6s4D4xXkSbTIMNzJXaXqUam6GmU"
        let urlString = "https://api.apilayer.com/exchangerates_data/convert?to=KZT&from=\(currencyName)&amount=1&apikey=\(apiKey)"
        performRequest(urlString: urlString)

    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let currency = self.parseJSON(currencyData: safeData) {
                        self.delegate?.didUpdateCurrencyModelList(with: currency, self)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(currencyData: Data) -> CurrencyModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: currencyData)
            let rate = decodedData.info.rate
            let from = decodedData.query.from
            let to = decodedData.query.to
            let currency = CurrencyModel(currencyFrom: from, currencyTo: to, rate: rate)
            return currency
        } catch {
            print(error)
            return nil
        }
    }
}
