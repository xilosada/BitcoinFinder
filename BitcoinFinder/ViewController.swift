//
//  ViewController.swift
//  BitcoinFinder
//
//  Created by X.I. Losada on 20/11/15.
//  Copyright © 2015 xiLosada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LocalBitcoinAPI.sharedInstance.getAds(41.3833, longitude: 2.1833)
        CoinDeskAPI.sharedInstance.getBPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

