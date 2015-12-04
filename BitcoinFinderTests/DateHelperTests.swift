//
//  NSDateExtension.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 03/12/15.
//  Copyright © 2015 xiLosada. All rights reserved.
//

import XCTest

@testable import BitcoinFinder

class DateHelperTests: XCTestCase {
    
    let _ISODateString = "2015-12-03T13:02:00+00:00"
    let _secondsSince1970: Double = 1449147720
    var date: NSDate!
    
    override func setUp() {
        super.setUp()
        date = DateHelper.fromISOString(_ISODateString)
    }

    func testReturnTheCorrectDateFromISOString() {
        XCTAssertTrue( _secondsSince1970 == date.timeIntervalSince1970, "seconds since 1 Jan 1070 should be 1449147720")
    }
    
    func testReturnTheCorrectISOStringFromDate() {
        
        var dateString = DateHelper.getISOString(date, timeZone: NSTimeZone(abbreviation: "PET"))
        XCTAssertTrue("08:02:00" == dateString, "PET time string should be 08:02:00")
        
        dateString = DateHelper.getISOString(date, timeZone: NSTimeZone(abbreviation: "CET"))
        XCTAssertTrue("14:02:00" == dateString, "CET time string should be 14:02:00")
    
        dateString = DateHelper.getISOString(date, timeZone: NSTimeZone(abbreviation: "UTC"))
        XCTAssertTrue("13:02:00" == dateString, "UTC time string should be 13:02:00")
    }

}
