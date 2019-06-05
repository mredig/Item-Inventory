//
//  Item+CoreDataClass.swift
//  ItemInventory
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
	convenience init(title: String, location: String, description: String, lent: Bool, imageURL: URL?, id: UUID = UUID(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
		self.init(context: context)
		self.title = title
		self.location = location
		self.itemDescription = description
		self.lent = lent
		self.imageURI = imageURL
		self.id = id
	}
}
