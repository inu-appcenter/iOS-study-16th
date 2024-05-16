//
//  StateController.swift
//  Contacts
//
//  Created by Matteo Manferdini on 29/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import Foundation
import UIKit

class StateController {
	private(set) var contacts: [Contact] = [
        Contact(image: UIImage(named: "배트맨"), name: "배트맨", message: "박쥐인간", address: "지구", phone: "010-1234-1234"),
        Contact(image: UIImage(named: "베조스.png"), name: "베조스", message: "베조스",address: "지구", phone: "010-1234-5678"),
        Contact(image: UIImage(named: "스티브.png"), name: "stive", message: "i am apple",address: "지구", phone: "010-1234-5678"),
        Contact(image: UIImage(named: "임꺽정.png"), name: "임꺽정", message: "자전거사랑" , address: "지구", phone: "010-1234-5678"),
        Contact(image: UIImage(named: "조커.png"), name: "Joker", message: "hahahahaa",address: "지구", phone: "010-1234-5678"),
        Contact(image: UIImage(named: "홍길동.png"), name: "홍길동", message: "동에번쩍서에번쩍",address: "지구", phone: "010-1234-5678"),
    ]
	
	var favorites: [Contact] = []
	
	func update(_ contact: Contact) {
		for (index, old) in contacts.enumerated() {
			if old.name == contact.name {
				contacts[index] = contact
				break
			}
		}
	}
}
