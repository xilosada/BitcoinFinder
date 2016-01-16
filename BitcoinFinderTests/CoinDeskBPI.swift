//
//  Copyright 2015 X.I. Losada.
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
//

import Foundation

struct CoinDeskBPI: Equatable{
    let rate: Double!
    let time: NSDate!
    
    init (fromJson json: [String:AnyObject]){
        rate = json["bpi"]!["EUR"]!!["rate_float"]!! as! Double
        time = DateHelper.fromISOString(json["time"]!["updatedISO"]!! as! String)
    }
    
    static func formatDate(dateString: String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        return dateFormatter.dateFromString(dateString)!
    }
}

func ==(lhs: CoinDeskBPI, rhs: CoinDeskBPI) -> Bool {
    return lhs.rate == rhs.rate && lhs.time == rhs.time
}
