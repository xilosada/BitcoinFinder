//
//  AdTests.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 16/01/16.
//  Copyright © 2016 xiLosada. All rights reserved.
//

import XCTest
@testable import BitcoinFinder

class AdTests: XCTestCase {

    let jsonData: NSData = "{\"data\": {\"profile\": {\"username\": \"escalicha\", \"feedback_score\": 100, \"trade_count\": \"1000+\", \"last_online\": \"2016-01-15T19:00:08+00:00\", \"name\": \"escalicha (1000+; 100%)\"}, \"require_feedback_score\": 0, \"hidden_by_opening_hours\": false, \"trade_type\": \"LOCAL_SELL\", \"ad_id\": 32840, \"temp_price\": \"385.14\", \"bank_name\": \"\", \"lon\": 2.17, \"trusted_required\": false, \"min_amount\": \"500\", \"visible\": true, \"require_identification\": false, \"temp_price_usd\": \"420.34\", \"lat\": 41.39, \"age_days_coefficient_limit\": \"4.00\", \"is_local_office\": false, \"first_time_limit_btc\": null, \"atm_model\": null, \"city\": \"Barcelona\", \"location_string\": \"Barcelona, Spain\", \"countrycode\": \"ES\", \"currency\": \"EUR\", \"created_at\": \"2013-09-26T14:51:13+00:00\", \"max_amount\": \"8000\", \"reference_type\": \"SHORT\", \"sms_verification_required\": false, \"require_trade_volume\": 0.00, \"online_provider\": \"NATIONAL_BANK\", \"max_amount_available\": \"8000\", \"payment_window_minutes\": 60, \"msg\": \"Contact hours: 6.30am - 23.59pm\\r\\n\\r\\nMeeting preferences: Abat Oliba CEU // Plaza Catalu\\u00f1a// A concretar\\r\\n\\r\\nPor favor, contactar por whatsapp para ir m\\u00e1s r\\u00e1pido.\\r\\nPlease, contact with whatsapp to go faster\\r\\n+0034 684065152\", \"email\": null, \"volume_coefficient_btc\": \"1.50\", \"distance\": 0.85}, \"actions\": {\"public_view\": \"https://localbitcoins.com/ad/32840\"}}".dataUsingEncoding(NSUTF8StringEncoding)!
    
    var asJson : [String:AnyObject]?
    
    override func setUp() {
        super.setUp()
        if let jsonParsed = try?
            NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions(rawValue: 0)).valueForKey("data") as! [String:AnyObject]{
                asJson = jsonParsed
        }
        else{
            XCTFail("Error generating sample json")
        }
    }
    
    func testInitializationFromJson() {
        let ad = Ad(dictionary: asJson!)
        XCTAssertTrue(ad.lat == 41.39, "Latitude parsing error")
        XCTAssertTrue(ad.lon == 2.17, "Longitude parsing error")
        XCTAssertTrue(ad.price == 385.14, "Price parsing error \(ad.price) != 385.14")
        XCTAssertTrue(ad.username == "escalicha", "Username parsing error \(ad.username)")
        XCTAssertTrue(ad.feedBackRate == 100, "FeedBackRate parsing error \(ad.feedBackRate)")
        XCTAssertTrue(ad.traderLevel == "1000+", "TraderLevel parsing error  \(ad.traderLevel)")
    }

}
