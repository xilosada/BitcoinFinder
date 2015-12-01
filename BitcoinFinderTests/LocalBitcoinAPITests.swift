//
//  LocalBitcoinAPITests.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 20/11/15.
//  Copyright © 2015 xiLosada. All rights reserved.
//

import XCTest
import MapKit

@testable import BitcoinFinder

class LocalBitcoinAPITests: XCTestCase {

    
    let localbitcoinApi = LocalBitcoinAPI.sharedInstance
    
    let barcelonaLatLon = (41.3833, 2.1833)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        localbitcoinApi.getAds(barcelonaLatLon.0, longitude: barcelonaLatLon.1)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
