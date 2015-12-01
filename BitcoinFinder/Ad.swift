//
//  Ad.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 29/11/15.
//  Copyright © 2015 xiLosada. All rights reserved.
//

import Foundation

class Ad {
    
    let lat: Double
    let lon: Double
    let price: Double?
    
    struct Keys {
        static let lat = "lat"
        static let lon = "lon"
        static let  price = "temp_price"
    }
    
    init (dictionary: [String: AnyObject]){
        lat = dictionary[Keys.lat] as! Double
        lon = dictionary[Keys.lon] as! Double
        price = Double(dictionary[Keys.price] as! String)
    }
}
