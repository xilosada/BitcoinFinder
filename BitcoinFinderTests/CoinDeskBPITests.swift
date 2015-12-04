//
//  CoinDeskBPITests.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 03/12/15.
//  Copyright © 2015 xiLosada. All rights reserved.
//

import XCTest

@testable import BitcoinFinder

class CoinDeskBPITests: XCTestCase {
    
    let _BPIJSONString = "{\"time\":{\"updated\":\"Dec 3, 2015 15:46:00 UTC\",\"updatedISO\":\"2015-12-03T15:46:00+00:00\",\"updateduk\":\"Dec 3, 2015 at 15:46 GMT\"},\"disclaimer\":\"This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org\",\"bpi\":{\"USD\":{\"code\":\"USD\",\"rate\":\"359.9950\",\"description\":\"United States Dollar\",\"rate_float\":359.995},\"EUR\":{\"code\":\"EUR\",\"rate\":\"334.7082\",\"description\":\"Euro\",\"rate_float\":334.7082}}}"

    var bpi: CoinDeskBPI!
    
    override func setUp() {
        super.setUp()
        let data = _BPIJSONString.dataUsingEncoding(NSUTF8StringEncoding)!
        // convert NSData to 'AnyObject'
        let json: [String:AnyObject] = try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! [String:AnyObject]
        bpi = CoinDeskBPI(fromJson: json)
    }
    
    func testInitializeFromJSON() {
        XCTAssertTrue(334.7082 == bpi.rate, "The rate should be 334.7082")
        XCTAssertNotNil(bpi.time, "The time can't be nil")
    }

}
