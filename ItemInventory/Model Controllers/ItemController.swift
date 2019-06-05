//
//  ItemController.swift
//  ItemInventory
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import Foundation
import RealmSwift

class ItemController {

	lazy var realm: Realm = {
		do {
			let realm = try Realm()
			return realm
		} catch {
			fatalError("Couldn't initialize Realm: \(error)")
		}
	}()

	lazy var items: Results<Item> = {
		return realm.objects(Item.self)
	}()


	@discardableResult func createItem(title: String, location: String, description: String, lent: Bool, imageURI: URL?) -> Item {
		let item = Item(title: title, location: location, lent: lent, imageURL: imageURI, description: description)
		save(items: [item])

		return item
	}

	func update(item: Item, title: String, location: String, description: String, lent: Bool, imageURI: URL?) {
		do {
			try realm.write {
				item.title = title
				item.location = location
				item.itemDescription = description
				item.lent = lent
				item.imageURL = imageURI
			}
		} catch {
			NSLog("Error updating item \(item): \(error)")
		}
	}

	func delete(items: [Item]) {
		do {
			try realm.write {
				realm.delete(items)
			}
		} catch {
			NSLog("Error deleting objects: \(error)")
		}
	}

	func save(items: [Item]) {
		do {
			try realm.write {
				realm.add(items)
			}
		} catch {
			NSLog("Error saving to realm: \(error)")
		}
	}
}
