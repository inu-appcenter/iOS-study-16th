//
//  DetailViewController.swift
//  Contacts
//
//  Created by Matteo Manferdini on 27/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
	func update(_ contact: Contact)
}

class DetailViewController: UITableViewController {
	@IBOutlet var imageView: UIImageView?
	@IBOutlet var nameLabel: UILabel?
	@IBOutlet var messageLabel: UILabel?
	@IBOutlet var addressLabel: UIButton?
	@IBOutlet var phoneButton: UIButton?
	
	var contact: Contact?
	weak var delegate: DetailViewControllerDelegate?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		imageView?.image = contact?.image
		nameLabel?.text = contact?.name
		messageLabel?.text = contact?.message
        addressLabel?.setTitle(contact?.address, for: .normal)
		phoneButton?.setTitle(contact?.phone, for: .normal)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		segue.forward(contact, to: segue.destination)
	}
	
	@IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {}
	
	@IBAction func save(_ unwindSegue: UIStoryboardSegue) {
		if let editViewController = unwindSegue.source as? EditContactViewController {
			contact = editViewController.contact
			if let contact = contact {
				delegate?.update(contact)
			}
		}
	}
}
