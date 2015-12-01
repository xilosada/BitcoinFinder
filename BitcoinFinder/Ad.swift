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
