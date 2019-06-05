//
//  Item.swift
//  ItemInventory
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Item: Object {
	dynamic var id = UUID().uuidString
	dynamic var title: String = ""
	dynamic var location: String = ""
	dynamic var lent: Bool = false
	dynamic var imageURLString: String?
	dynamic var itemDescription: String?

	convenience init(title: String, location: String, lent: Bool, imageURL: URL?, description: String?) {
		self.init()
		self.title = title
		self.location = location
		self.lent = lent
		self.imageURLString = imageURL?.absoluteString
		self.itemDescription = description
	}

	var imageURL: URL? {
		get {
			guard let imageURLString = imageURLString else { return nil}
			return URL(fileURLWithPath: imageURLString)
		}
		set {
			imageURLString = newValue?.absoluteString
		}
	}

}
