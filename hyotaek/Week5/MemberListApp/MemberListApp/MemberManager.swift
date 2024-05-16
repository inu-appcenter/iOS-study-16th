//
//  MemberInfo.swift
//  MemberListApp
//
//  Created by HyoTaek on 5/16/24.
//

import Foundation

//protocol MemberManagerDelegate: AnyObject {
//    func memberInfoUpdated()
//}

final class MemberManager {
//    weak var delegate: MemberManagerDelegate?
    
    static let shared = MemberManager()
    
    struct Member {
        var memberImg: String
        var memberID: String
        var memberName: String
        var memberAge: String
        var memberPhone: String
        var memberAdress: String
    }
    private var members: [Member] = []
    
    private init() {
        self.members = [
            Member(memberImg: "배트맨", memberID: "0", memberName: "배트맨", memberAge: "20", memberPhone: "010-0000-0000", memberAdress: "서울"),
            Member(memberImg: "베조스", memberID: "1", memberName: "베조스", memberAge: "21", memberPhone: "010-1111-1111", memberAdress: "경기도"),
            Member(memberImg: "스티브", memberID: "2", memberName: "스티브", memberAge: "22", memberPhone: "010-2222-2222", memberAdress: "인천"),
            Member(memberImg: "임꺽정", memberID: "3", memberName: "임꺽정", memberAge: "23", memberPhone: "010-3333-3333", memberAdress: "충남"),
            Member(memberImg: "조커", memberID: "4", memberName: "조커", memberAge: "24", memberPhone: "010-4444-4444", memberAdress: "충북"),
            Member(memberImg: "쿡", memberID: "5", memberName: "쿡", memberAge: "25", memberPhone: "010-5555-5555", memberAdress: "강원"),
            Member(memberImg: "홍길동", memberID: "6", memberName: "홍길동", memberAge: "26", memberPhone: "010-6666-6666", memberAdress: "우주")
        ]
    }
    
    func getAllMembers() -> [Member] {
        return members
    }
    
    func updateMemberInfo(updatedMember: Member) {
        print("매니저: \(updatedMember)")
        
        var updatedMembers: [Member] = []
        
        for member in members {
            if member.memberID == updatedMember.memberID {
                updatedMembers.append(updatedMember)
            }
            else {
                updatedMembers.append(member)
            }
        }
        members = updatedMembers
//        delegate?.memberInfoUpdated()
    }
}
