//
//  ItemController.swift
//  ItemInventory
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import Foundation


class ItemController {

	@discardableResult func createItem(title: String, location: String, description: String, lent: Bool, imageURI: URL?) -> Item {
		let item = Item(title: title, location: location, description: description, lent: lent, imageURL: imageURI)
		guard let context = item.managedObjectContext else { return item }
		try? CoreDataStack.shared.save(context: context)

		return item
	}

	func update(item: Item, title: String, location: String, description: String, lent: Bool, imageURI: URL?) {
		guard let context = item.managedObjectContext else { return }
		item.title = title
		item.location = location
		item.itemDescription = description
		item.lent = lent
		item.imageURI = imageURI

		try? CoreDataStack.shared.save(context: context)
	}
}
