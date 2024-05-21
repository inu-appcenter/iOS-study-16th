//
//  MemberTableViewCell.swift
//  ContactApp
//
//  Created by 한현승 on 5/16/24.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberAddress: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        memberImage.layer.cornerRadius = memberImage.frame.height/2
        memberImage.layer.borderWidth = 0
        memberImage.clipsToBounds = true
        memberImage.contentMode = .scaleToFill
    }
    
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
