//
//  ViewController.swift
//  ContactApp
//
//  Created by 한현승 on 5/16/24.
//

import UIKit

var memberlist = [MemberData]()


class ViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        registerNib()
        
        memberlist.append(MemberData(memberImage: "배트맨.png", memberNum: "1", memberName: "배트맨", memberAge: "20", memberTell: "010-1234-1234", memberAddress: "인천대학교"))
        memberlist.append(MemberData(memberImage: "임꺽정.png", memberNum: "2", memberName: "임꺽정", memberAge: "20", memberTell: "010-1234-1234", memberAddress: "인천대학교"))
        
    }
    
    private func registerNib() {
        let nibName = UINib(nibName: MemberTableViewCell.identifier, bundle: nil)
        listTableView.register(nibName, forCellReuseIdentifier: MemberTableViewCell.identifier)
    }

    @IBAction func addMember(_ sender: Any) {
        guard let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddMemberViewController") as? AddMemberViewController else {return}
        
        self.navigationController?.pushViewController(addVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        listTableView.reloadData()
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(withIdentifier: MemberTableViewCell.identifier, for: indexPath) as! MemberTableViewCell
        let member = memberlist[indexPath.row]
        
        if let imagePath = member.memberImage {
                    let fileManager = FileManager.default
                    let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
                    let documentsDirectory = urls[0]
                    let imageURL = documentsDirectory.appendingPathComponent(imagePath)
                    cell.memberImage.image = UIImage(contentsOfFile: imageURL.path)
        } else {
                cell.memberImage.image = UIImage(named: "defaultImage.png")
        }
        cell.memberImage.image = UIImage(named: member.memberImage!)
        cell.memberName.text = member.memberName
        cell.memberAddress.text = member.memberAddress
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "MemberDetailViewController") as? MemberDetailViewController else {return}
        
        let selectedMember = memberlist[indexPath.row]
        detailVC.memberInfo = selectedMember
        detailVC.memberIndex = indexPath.row
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
          
          
}
