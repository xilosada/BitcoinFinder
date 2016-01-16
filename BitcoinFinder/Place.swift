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

class Place: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var offers: [Offer]
    
    init(name: String, latitude: Double, longitude: Double, context: NSManagedObjectContext) {
        
        let entity =  NSEntityDescription.entityForName("Place", inManagedObjectContext: context)!
        
        super.init(entity: entity,insertIntoManagedObjectContext: context)
        
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}