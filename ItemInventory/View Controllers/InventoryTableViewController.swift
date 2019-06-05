//
//  InventoryTableViewController
//  ItemInventory
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit
import RealmSwift

class InventoryTableViewController: UITableViewController {

	let itemController = ItemController()
	var token: NotificationToken?


	override func viewDidLoad() {
		super.viewDidLoad()
		token = itemController.items.observe(tableView.applyChanges)
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let dest = segue.destination as? ItemDetailViewController {
			dest.itemController = itemController
			if segue.identifier == "ShowItemSegue" {
				guard let indexPath = tableView.indexPathForSelectedRow else { return }
				dest.item = itemController.items[indexPath.row]
			}
		}
	}
}

// MARK: - TableView Stuff
extension InventoryTableViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemController.items.count
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return nil
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		guard let itemCell = cell as? ItemTableViewCell else { return cell }
		itemCell.item = itemController.items[indexPath.row]
		return itemCell
	}
}

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
