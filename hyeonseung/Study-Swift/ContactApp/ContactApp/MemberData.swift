//
//  MemberData.swift
//  ContactApp
//
//  Created by 한현승 on 5/16/24.
//

import Foundation


struct MemberData {
    var memberImage: String?
    var memberNum: String?
    var memberName: String?
    var memberAge: String?
    var memberTell: String?
    var memberAddress: String?
    
    init(memberImage: String?, memberNum: String?, memberName: String?, memberAge: String?, memberTell: String?, memberAddress: String?) {
        self.memberImage = memberImage
        self.memberNum = memberNum
        self.memberName = memberName
        self.memberAge = memberAge
        self.memberTell = memberTell
        self.memberAddress = memberAddress
    }
}
