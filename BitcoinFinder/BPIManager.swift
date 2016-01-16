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

import RxSwift
import Foundation

class BPIManager {
    
    var coinDeskAPI: CoinDeskAPI!
    let disposeBag = DisposeBag()

    init () {
        coinDeskAPI = CoinDeskAPI(dataScheduler: MainScheduler.sharedInstance, URLSession: NSURLSession.sharedSession())
    }
    
    func fetchBPIUpdates() -> Observable<CoinDeskBPI> {
        return timer(0, 30, MainScheduler.sharedInstance)
            .flatMap({_ in return self.coinDeskAPI.getBPI()})
            .distinctUntilChanged()
    }
}