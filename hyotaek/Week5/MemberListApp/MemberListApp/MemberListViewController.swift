//
//  ViewController.swift
//  MemberListApp
//
//  Created by HyoTaek on 5/16/24.
//

//1. 싱글톤 패턴을 이용해 멤버들의 정보를 모두 넣는다.
//2. 테이블뷰 구현
//3. 추가, 수정, 삭제


import UIKit

class MemberListViewController: UIViewController, MemberDetailDelegate {
    @IBOutlet weak var memberTableView: UITableView!
    
    func memberUpdated(updatedMember: MemberManager.Member) {
        if let index = memberList.firstIndex(where: { $0.memberID == updatedMember.memberID }) {
            memberList[index] = updatedMember
            memberTableView.reloadData()
        }
    }
    
    var memberList: [MemberManager.Member] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "회원 목록"
        
        memberList = MemberManager.shared.getAllMembers()

        registerXib()
        
        memberTableView.delegate = self
        memberTableView.dataSource = self
        
//        memberTableView.reloadData()
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "MemberCell", bundle: nil)
        memberTableView.register(nibName, forCellReuseIdentifier: MemberCell.identifier)
    }
}

extension MemberListViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return memberList.count
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = memberTableView.dequeueReusableCell(withIdentifier: MemberCell.identifier, for: indexPath) as? MemberCell else {
                return UITableViewCell()
            }
            
            let target = memberList[indexPath.section]

            let img = UIImage(named: "\(target.memberImg).png")
            cell.memberImg?.image = img
            cell.memberName?.text = target.memberName
            cell.memberAddress?.text = target.memberAdress

            return cell
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedMember = memberList[indexPath.section]
            
//            var selectedMemberIndex = indexPath.row
            guard let DetailMemberVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailMemberViewController") as? DetailMemberViewController else {
                return
            }
//            DetailMemberVC.viewMode = update
            DetailMemberVC.memberData = selectedMember
//            DetailMemberVC.setMemberData(memberData: selectedMember)
            DetailMemberVC.delegate = self
            self.navigationController?.pushViewController(DetailMemberVC, animated: true)
            
            navigationItem.backButtonTitle = "회원 목록"
        }
}

