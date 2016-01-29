//
//  CoinDeskAPITests.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 02/12/15.
//  Copyright © xiLosada. All rights reserved.
//

import XCTest
import RxBlocking
import RxSwift

@testable import BitcoinFinder

class CoinDeskAPITests: XCTestCase {

    var coinDeskAPI: CoinDeskAPI!
    let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()
        coinDeskAPI = CoinDeskAPI(dataScheduler: MainScheduler.instance, URLSession: NSURLSession.sharedSession())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatGetBintcoinPriceIndex(){
        self.measureBlock {
            let bpiObservable : Observable<CoinDeskBPI> = self.coinDeskAPI.getBPI()
            do {
                let index: CoinDeskBPI = try bpiObservable.toBlocking().last()!
                XCTAssertNotNil(index, "Bitcoin Price Index is not nil")
                XCTAssertTrue(index.rate > 0, "Bitcoin Price Index is more than 0")
            } catch {
                XCTFail("Exception getting price from CoinDeskAPI")
            }
        }
    }
    
    

}
