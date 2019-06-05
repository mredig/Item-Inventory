//
//  ItemDetailViewController.swift
//  ItemInventory
//
//  Created by Michael Redig on 6/4/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
	@IBOutlet var itemImageView: UIImageView!
	@IBOutlet var itemTitleTextField: UITextField!
	@IBOutlet var itemLocationTextField: UITextField!
	@IBOutlet var itemDescriptionTextView: UITextView!
	@IBOutlet var lentSwitch: UISwitch!

	var itemController: ItemController?
	var item: Item? {
		didSet {
			updateViews()
		}
	}

	override func viewDidLoad() {
		updateViews()
	}

	private func updateViews() {
		navigationItem.title = "Mah New Thing"
		guard let item = item, isViewLoaded else { return }
		navigationItem.title = item.title
		itemTitleTextField.text = item.title
		itemLocationTextField.text = item.location
		itemDescriptionTextView.text = item.itemDescription
		lentSwitch.isOn = item.lent
	}

	@IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
		guard let title = itemTitleTextField.text, !title.isEmpty,
			let location = itemLocationTextField.text,
			let description = itemDescriptionTextView.text else { return }

		if let item = item {
			itemController?.update(item: item, title: title, location: location, description: description, lent: lentSwitch.isOn, imageURI: nil)
		} else {
			_ = Item(title: title, location: location, description: description, lent: lentSwitch.isOn, imageURL: nil)
		}

		navigationController?.popViewController(animated: true)

	}

	@IBAction func lentSwitchToggled(_ sender: UISwitch) {

	}

}
