//
//  DetailMemberViewController.swift
//  MemberListApp
//
//  Created by HyoTaek on 5/16/24.
//

import Foundation
import UIKit

protocol MemberDetailDelegate: AnyObject {
    func memberUpdated(updatedMember: MemberManager.Member)
}

class DetailMemberViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    weak var delegate: MemberDetailDelegate?
    enum viewMode {
        case update, save
    }
    
    @IBOutlet weak var memberImg: UIImageView!
    @IBOutlet weak var memberIDLabel: UILabel!
    @IBOutlet weak var memberNameField: UITextField!
    @IBOutlet weak var memberAgeField: UITextField!
    @IBOutlet weak var memberPhoneField: UITextField!
    @IBOutlet weak var memberAddressField: UITextField!
    
    var memberData: MemberManager.Member?
//    var viewMode: viewMode
    
//    init(viewMode: viewMode, memberData: MemberManager.Member?) {
//        self.viewMode = viewMode
//        self.memberData = memberData
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    func setupUI(viewMode: viewMode, memberData: MemberManager.Member??) {
//        switch viewMode {
//        case .save:
//            submitButton.setTitle("SAVE", for: .normal)
//        case .update:
//            submitButton.setTitle("UPDATE", for: .normal)
//            if let data = data {
//                memberIDTextField.text = String(data.memberID)
//                nameTextField.text = data.name
//                ageTextField.text = String(data.age)
//                phoneTextField.text = data.phone
//                addressTextField.text = data.address
//            }
//        }
//    }
    
    func setMemberData(memberData: MemberManager.Member) {
        memberImg.image = UIImage(named: "\(memberData.memberImg).png")
        memberIDLabel.text = memberData.memberID
        memberNameField.text = memberData.memberName
        memberAgeField.text = memberData.memberAge
        memberPhoneField.text = memberData.memberPhone
        memberAddressField.text = memberData.memberAdress
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupUI(mode: memberDetailPageMode, data: memberData)
        
        guard let memberData = memberData else { return }
        setMemberData(memberData: memberData)
        
//        MemberManager.shared.delegate = self
    }
    
    
//    @IBAction func changeImageTapped(_ sender: UITapGestureRecognizer) {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.sourceType = .photoLibrary
//        imagePickerController.delegate = self
//        present(imagePickerController, animated: true, completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
//            fatalError("에러 발생: \(info)")
//        }
//        memberImg.image = selectedImage
//
//        dismiss(animated: true, completion: nil)
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
    
    
    
    @IBAction func updateMemberInfo(_ sender: Any) {
        guard let updatedMemberName = memberNameField.text,
              let updatedMemberAge = memberAgeField.text,
              let updatedMemberPhone = memberPhoneField.text,
              let updatedMemberAddress = memberAddressField.text,
              let updatedMemberID = memberIDLabel.text,
              // memberData는 img 때문에 임시로 남겨 놓은 것. 나중에 다른 것들처럼 수정할 예정
              let memberData = memberData else {
            return
        }
        
        // 업데이트된 멤버 정보 생성
        let updatedMember = MemberManager.Member(memberImg: memberData.memberImg,
                                                 memberID: updatedMemberID,
                                                 memberName: updatedMemberName,
                                                 memberAge: updatedMemberAge,
                                                 memberPhone: updatedMemberPhone,
                                                 memberAdress: updatedMemberAddress)
        
        MemberManager.shared.updateMemberInfo(updatedMember: updatedMember)
        setMemberData(memberData: updatedMember)
        delegate?.memberUpdated(updatedMember: updatedMember)
        navigationController?.popViewController(animated: true)
        print(updatedMember)
    }
}

extension DetailMemberViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // TextField 비활성화
        return true
    }
}


