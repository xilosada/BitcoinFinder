//
//  OfferInfo.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 16/01/16.
//  Copyright © 2016 xiLosada. All rights reserved.
//

import Foundation


public struct OfferInfo {
    
    let price: Double
    let type: Int
    let place: Place
    let trader: Trader
    
    init(price: Double, type: Int, place: Place, trader: Trader) {
        self.price = price
        self.type = type
        self.place = place
        self.trader = trader
    }
}