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
import RxSwift

class LocalBitcoinAPI {
    
    let url = "https://localbitcoins.com/api/places/"
    
    static let sharedInstance = LocalBitcoinAPI()
    
    private init () {}
    
    func getAds(latitude: Double, longitude: Double, completionHandler: (ads: [Ad]? ,error: NSError?) -> ()) {
        var ads = [Ad]()
        Alamofire.request(.GET, url, parameters: ["lat": latitude, "lon" : longitude]).responseJSON(completionHandler: { response in
            if let error = response.result.error{
                completionHandler(ads:nil, error:error)
            }
            else if response.result.isSuccess {
                let data = response.result.value!["data"]
                //let placeCount = data!!["place_count"]
                let places = data!!["places"] as! [AnyObject]
                places.forEach { place in
                    let buyURL: NSURL = NSURL(string: place["buy_local_url"] as! String)!
                    let sellURL: NSURL = NSURL(string: place["sell_local_url"] as! String)!
                    ads.appendContentsOf(self.getAdsFromURL(buyURL))
                    ads.appendContentsOf(self.getAdsFromURL(sellURL))
                }
                completionHandler(ads:ads,error:nil)
        
                /*
                    "buy_local_url" = "https://localbitcoins.com/buy-bitcoins-with-cash/45268/08020-es/.json";
                    lat = "41.38";
                    "location_string" = "08020, ES";
                    lon = "2.18";
                    "sell_local_url" = "https://localbitcoins.com/sell-bitcoins-for-cash/45268/08020-es/.json";
                    url = "/places/45268/08020-es/";
                    
                    
                    */
            }
        })
    }

    func getAdsFromURL(url: NSURL) -> [Ad]{
        var ads = [Ad]()
        Alamofire.request(.GET, url).responseJSON(completionHandler: { response in
            print(response.result.value)
            let data = response.result.value!["data"]!
            _ = data!["ad_count"]
            let adArray = data!["ad_list"] as! [AnyObject]
            adArray.forEach( { ad in
                print(ad["data"]!!["ad_id"] )
                let obj = Ad(dictionary: ad["data"] as! [String: AnyObject])
                ads.append(obj)
            })
        })
        return ads
    }
}

