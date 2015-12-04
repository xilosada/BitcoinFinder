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
import RxCocoa
import RxSwift

public class CoinDeskAPI {
    
    let _url = NSURL(string: "https://api.coindesk.com/v1/bpi/currentprice/EUR.json")!
    
    let dataScheduler: ImmediateSchedulerType!
    let URLSession: NSURLSession!
    
    public init(dataScheduler: ImmediateSchedulerType, URLSession: NSURLSession) {
        self.dataScheduler = dataScheduler
        self.URLSession = URLSession
    }
    
    /**
        returns the most recent price index from CoinDesk
     */
    func getBPI() -> Observable<CoinDeskBPI> {
        return self.URLSession.rx_JSON(_url)
            .map { json in
                return CoinDeskBPI(fromJson: json as! [String : AnyObject])
            }.observeOn(self.dataScheduler)
    }
}