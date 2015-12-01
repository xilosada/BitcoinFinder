//
//  LocalBitcoinAPI.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 20/11/15.
//  Copyright © 2015 xiLosada. All rights reserved.
//

import Foundation
import Alamofire

class LocalBitcoinAPI {
    
    let url = "https://localbitcoins.com/api/places/"
    
    static let sharedInstance = LocalBitcoinAPI()
    
    private init () {}
    
    func getAds(latitude: Double, longitude: Double) -> [Ad]{
        var ads = [Ad]()
        Alamofire.request(.GET, url, parameters: ["lat": latitude, "lon" : longitude]).responseJSON(completionHandler: { response in
            if let error = response.result.error{
                print(error)
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

                
                /*
                    "buy_local_url" = "https://localbitcoins.com/buy-bitcoins-with-cash/45268/08020-es/.json";
                    lat = "41.38";
                    "location_string" = "08020, ES";
                    lon = "2.18";
                    "sell_local_url" = "https://localbitcoins.com/sell-bitcoins-for-cash/45268/08020-es/.json";
                    url = "/places/45268/08020-es/";
                    
                    
                    */
            }})
        return ads
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