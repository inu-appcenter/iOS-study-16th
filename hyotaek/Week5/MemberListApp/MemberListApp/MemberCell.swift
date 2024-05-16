//
//  MemberCell.swift
//  MemberListApp
//
//  Created by HyoTaek on 5/16/24.
//

import UIKit

class MemberCell: UITableViewCell {
    @IBOutlet weak var memberImg: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberAddress: UILabel!
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
