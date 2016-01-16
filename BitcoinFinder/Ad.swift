//
//  Copyright 2015 (C) Xabier I. Losada  (http://www.xilosada.com)
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

class Ad {
    
    let lat: Double
    let lon: Double
    let price: Double?
    let username: String
    let feedBackRate: Int
    let traderLevel: String
    
    struct Keys {
        static let Lat = "lat"
        static let Lon = "lon"
        static let Price = "temp_price"
        static let Profile = "profile"
        static let Username = "username"
        static let FeedBackRate = "feedback_score"
        static let TraderLevel = "trade_count"
    }
    
    init (dictionary: [String: AnyObject]){
        lat = dictionary[Keys.Lat] as! Double
        lon = dictionary[Keys.Lon] as! Double
        price = Double(dictionary[Keys.Price] as! String)
        username = dictionary[Keys.Profile]![Keys.Username] as! String
        feedBackRate = dictionary[Keys.Profile]![Keys.FeedBackRate] as! Int
        traderLevel = dictionary[Keys.Profile]![Keys.TraderLevel] as! String
    }
    
}

