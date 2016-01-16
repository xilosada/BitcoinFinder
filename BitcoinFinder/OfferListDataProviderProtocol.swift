//
//  OfferListDataProviderProtocol.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 16/01/16.
//  Copyright © 2016 xiLosada. All rights reserved.
//

import UIKit
import CoreData
import AddressBookUI

public protocol OfferListDataProviderProtocol: UITableViewDataSource {
    
    var managedObjectContext: NSManagedObjectContext? { get }
    weak var tableView: UITableView! { get set }
    
    func addOffer(offerInfo: OfferInfo)
    func fetch()
    
}