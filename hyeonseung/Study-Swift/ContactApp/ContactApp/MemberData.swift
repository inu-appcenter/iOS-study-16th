//
//  MemberData.swift
//  ContactApp
//
//  Created by 한현승 on 5/16/24.
//

import Foundation
import UIKit


struct MemberData {
    var memberImage: UIImage?
    var memberNum: String?
    var memberName: String?
    var memberAge: String?
    var memberTell: String?
    var memberAddress: String?
    
    init(memberImage: UIImage?, memberNum: String?, memberName: String?, memberAge: String?, memberTell: String?, memberAddress: String?) {
        self.memberImage = memberImage
        self.memberNum = memberNum
        self.memberName = memberName
        self.memberAge = memberAge
        self.memberTell = memberTell
        self.memberAddress = memberAddress
    }
}
