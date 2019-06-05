//
//  UITableView+Helper.swift
//  ItemInventory
//
//  Created by Michael Redig on 6/5/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit
import RealmSwift

extension UITableView {
	func applyChanges<T>(changes: RealmCollectionChange<T>) {
		switch changes {
		case .initial: reloadData()
		case .update(_, let deletions, let insertions, let updates):
			let fromRow = {(row: Int) in
				return IndexPath(row: row, section: 0)}

			beginUpdates()
			deleteRows(at: deletions.map(fromRow), with: .automatic)
			insertRows(at: insertions.map(fromRow), with: .automatic)
			reloadRows(at: updates.map(fromRow), with: .none)
			endUpdates()
		default: break
		}
	}
}
