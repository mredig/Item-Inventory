//
//  Item+CoreDataProperties.swift
//  ItemInventory
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var location: String?
    @NSManaged public var lent: Bool
    @NSManaged public var imageURI: URL?
    @NSManaged public var itemDescription: String?

}
