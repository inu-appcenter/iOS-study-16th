//
//  ViewController.swift
//  ContactApp
//
//  Created by 한현승 on 5/16/24.
//

import UIKit


class MemberListViewController: UIViewController {
    
    let memberlist = MemberManager.shared
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        registerNib()
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

extension MemberListViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberlist.countMember()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: MemberTableViewCell.identifier, for: indexPath) as? MemberTableViewCell else {
            return UITableViewCell()
        }
     
        if  let member = memberlist.getMember(index: indexPath.row){
            
            cell.memberImage.image = member.memberImage
            cell.memberName.text = member.memberName
            cell.memberAddress.text = member.memberAddress
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "MemberDetailViewController") as? MemberDetailViewController else {return}

        
        detailVC.memberIndex = indexPath.row
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
          
          
}
