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
