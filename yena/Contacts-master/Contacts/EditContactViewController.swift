//
//  EditContactViewController.swift
//  Contacts
//
//  Created by Matteo Manferdini on 27/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class EditContactViewController: UITableViewController {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var messageTextField: UITextField!
	@IBOutlet weak var addressTextField: UITextField!
	@IBOutlet weak var phoneTextField: UITextField!
	
	var contact: Contact?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		imageView.image = contact?.image
		nameTextField.text = contact?.name
		messageTextField.text = contact?.message
        addressTextField.text = contact?.address
		phoneTextField.text = contact?.phone
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let image = imageView.image,
		let name = nameTextField.text,
		let message = messageTextField.text,
		let address = addressTextField.text,
		let phone = phoneTextField.text {
			contact = Contact.init(image: image, name: name, message: message, address: address, phone: phone)
		}
	}
}

