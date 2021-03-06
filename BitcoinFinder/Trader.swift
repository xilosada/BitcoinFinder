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


import CoreData

class Trader: NSManagedObject {
    
    @NSManaged var username: String
    @NSManaged var feedbackRate: Int
    @NSManaged var traderLevel: String
    
    @NSManaged var offers: [Offer]
    
    init(username: String, feedbackRate: Int, traderLevel: String, context: NSManagedObjectContext) {
        
        let entity =  NSEntityDescription.entityForName("Trader", inManagedObjectContext: context)!
        
        super.init(entity: entity,insertIntoManagedObjectContext: context)
        
        self.username = username
        self.feedbackRate = feedbackRate
        self.traderLevel = traderLevel
    }
}