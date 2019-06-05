//
//  ItemTableViewCell.swift
//  ItemInventory
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
	@IBOutlet var itemImageView: UIImageView!
	@IBOutlet var itemTitleLabel: UILabel!
	@IBOutlet var itemLocationLabel: UILabel!

	var item: Item? {
		didSet {
			updateViews()
		}
	}

	private func updateViews() {
		guard let item = item else { return }
		itemTitleLabel.text = item.title
		itemLocationLabel.text = item.location
	}

	override func prepareForReuse() {
		// TODO: Reset image to placeholder (also make a placeholder)
	}
}
