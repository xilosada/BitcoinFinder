//
//  OfferListViewControllerTests.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 16/01/16.
//  Copyright © 2016 xiLosada. All rights reserved.
//

import CoreData
import XCTest
@testable import BitcoinFinder

class OfferListViewControllerTests: XCTestCase {

    var viewController: OfferListViewController!

    class MockDataProvider: NSObject, OfferListDataProviderProtocol {
        
        var managedObjectContext: NSManagedObjectContext?
        weak var tableView: UITableView!
        func addOffer(personInfo: OfferInfo) { }
        func fetch() { }
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
    
    
    override func setUp() {
        super.setUp()
        
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OfferListViewController") as! OfferListViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDataProviderHasTableViewPropertySetAfterLoading() {
        // given
        // 1
        let mockDataProvider = MockDataProvider()
        
        viewController.dataProvider = mockDataProvider
        
        // when
        // 2
        XCTAssertNil(mockDataProvider.tableView, "Before loading the table view should be nil")
        
        // 3
        let _ = viewController.view
        
        // then
        // 4
        XCTAssertTrue(mockDataProvider.tableView != nil, "The table view should be set")
        XCTAssert(mockDataProvider.tableView === viewController.tableView,
            "The table view should be set to the table view of the data source")
    }

}
