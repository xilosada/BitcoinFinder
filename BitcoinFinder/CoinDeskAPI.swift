//
//  CoinDeskAPI.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 29/11/15.
//  Copyright © 2015 xiLosada. All rights reserved.
//

import Foundation
import Alamofire

class CoinDeskAPI {
    
    let url = "https://api.coindesk.com/v1/bpi/currentprice/EUR.json"
    
    static let sharedInstance = CoinDeskAPI()
    
    private init () {}
    
    /**
        returns the most recent price index from CoinDesk
     */
    func getBPI(){
        Alamofire.request(.GET, url).responseJSON(completionHandler: { response in
            if let error = response.result.error{
                print(error)
            } else {
                let data = response.result.value!["bpi"]!!["EUR"]!!["rate_float"]
                print(data)
            }
        })
    }
}
