//
//  MemberManager.swift
//  ContactApp
//
//  Created by 한현승 on 5/21/24.
//

import Foundation
import UIKit


class MemberManager {
    static let shared = MemberManager()
    
    private init() {
        self.memberlist = [
            MemberData(memberImage: UIImage(named: "배트맨"),
                       memberNum: "1",
                       memberName: "배트맨",
                       memberAge: "20",
                       memberTell: "010-1234-1234",
                       memberAddress: "인천대학교"),
            MemberData(memberImage: UIImage(named: "임꺽정"),
                       memberNum: "2",
                       memberName: "임꺽정",
                       memberAge: "20",
                       memberTell: "010-1234-1234",
                       memberAddress: "한국"),
            MemberData(memberImage: UIImage(named: "베조스"),
                       memberNum: "3",
                       memberName: "베조스",
                       memberAge: "40",
                       memberTell: "010-1234-1234",
                       memberAddress: "NASA"),
            MemberData(memberImage: UIImage(named: "스티브"),
                       memberNum: "4",
                       memberName: "스티브",
                       memberAge: "20",
                       memberTell: "010-1234-1234",
                       memberAddress: "APPLE"),
            MemberData(memberImage: UIImage(named: "조커"),
                       memberNum: "5",
                       memberName: "조커",
                       memberAge: "20",
                       memberTell: "010-1234-1234",
                       memberAddress: "아메리카"),
            MemberData(memberImage: UIImage(named: "쿡"),
                       memberNum: "6",
                       memberName: "쿡",
                       memberAge: "20",
                       memberTell: "010-1234-1234",
                       memberAddress: "인천대학교"),
            MemberData(memberImage: UIImage(named: "홍길동"),
                       memberNum: "7",
                       memberName: "홍길동",
                       memberAge: "20",
                       memberTell: "010-1234-1234",
                       memberAddress: "한국 고전소설"),
        
        ]
    }
    
    private var memberlist = [MemberData]()
    
    // add
    func addMember(_ member: MemberData){
        memberlist.append(member)
    }
    
    // update
    func updateMember( index: Int, member: MemberData){
        guard index >= 0 && index < memberlist.count else {return}
        memberlist[index] = member
    }
    
    // get
    func getMember(index: Int) -> MemberData? {
        return memberlist[index]
    }
    
    
    func countMember() -> Int {
        return memberlist.count
    }
    

}
