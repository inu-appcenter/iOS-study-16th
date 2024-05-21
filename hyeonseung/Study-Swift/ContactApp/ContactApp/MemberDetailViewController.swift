////
////  MemberDetailViewController.swift
////  ContactApp
////
////  Created by 한현승 on 5/16/24.
////
//
import Foundation
import UIKit



class MemberDetailViewController: UIViewController {
    
    @IBOutlet weak var memberNum: UILabel!
    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberAge: UILabel!
    @IBOutlet weak var memberTel: UILabel!
    @IBOutlet weak var memberAddress: UILabel!
    
    @IBOutlet weak var numTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    
    @IBOutlet weak var imgBtn: UIButton!
    
    var memberIndex: Int?
    var memberInfo: MemberData?
    @IBOutlet var selectedImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imgBtn.layer.masksToBounds = true
        self.imgBtn.layer.cornerRadius = self.imgBtn.frame.size.width / 2
        
        memberNum.text = "멤버번호: "
        memberName.text = "이     름: "
        memberAge.text = "나     이: "
        memberTel.text = "전화번호: "
        memberAddress.text = "주     소: "
        
        if let info = memberInfo {
            numTF?.text = info.memberNum
            nameTF?.text = info.memberName
            ageTF?.text = info.memberAge
            telTF?.text = info.memberTell
            addressTF?.text = info.memberAddress
        
            selectedImage?.image = info.memberImage
            selectedImage?.layer.cornerRadius = (selectedImage?.frame.height)!/2
            selectedImage?.clipsToBounds = true
            selectedImage?.layer.borderWidth = 0
            selectedImage?.contentMode = .scaleAspectFill
            // 이미지 버튼 설정
            imgBtn.setImage(info.memberImage, for: .normal)
            imgBtn.imageView?.contentMode = .scaleToFill
            imgBtn.clipsToBounds = true
            
        }
        
    }
    
    @IBAction func updateMember(_ sender: Any) {
        guard let index = memberIndex else {return}
        
        let updatedNum = numTF.text ?? ""
        let updatedName = nameTF.text ?? ""
        let updatedAge = ageTF.text ?? ""
        let updatedTel = telTF.text ?? ""
        let updatedAddress = addressTF.text ?? ""

        let updatedImageName = selectedImage?.image

        // 배열에서 기존 멤버 정보 업데이트
        memberlist[index] = MemberData(memberImage: updatedImageName, memberNum: updatedNum, memberName: updatedName, memberAge: updatedAge, memberTell: updatedTel, memberAddress: updatedAddress)
              

        self.navigationController?.popViewController(animated: true)
    }
    
}


extension MemberDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func uploadPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            selectedImage?.image = pickedImage
            selectedImage?.layer.cornerRadius = (self.selectedImage?.frame.height)!/2
            selectedImage?.clipsToBounds = true
            selectedImage?.contentMode = .scaleToFill
            
            imgBtn.setImage(pickedImage, for: .normal)
            imgBtn.imageView?.contentMode = .scaleToFill
            imgBtn.clipsToBounds = true
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
