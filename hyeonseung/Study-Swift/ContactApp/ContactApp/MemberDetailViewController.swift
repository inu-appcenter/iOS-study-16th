//
//  MemberDetailViewController.swift
//  ContactApp
//
//  Created by 한현승 on 5/16/24.
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
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            
            // 이미지 버튼 설정
            if let imagePath = info.memberImage {
                let fileManager = FileManager.default
                let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
                let documentsDirectory = urls[0]
                let imageURL = documentsDirectory.appendingPathComponent(imagePath)
                if let image = UIImage(contentsOfFile: imageURL.path) {
                    imgBtn.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
                } else {
                    imgBtn.setImage(UIImage(named: "defaultImage.png"), for: .normal)
                }
            } else {
                imgBtn.setImage(UIImage(named: "defaultImage.png"), for: .normal)
            }
            imgBtn.imageView?.contentMode = .scaleAspectFill
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

        let updatedImageName = selectedImage == nil ? memberInfo?.memberImage ?? "defaultImage.png" : saveImageToDocuments(image: selectedImage!)

        
        // 배열에서 기존 멤버 정보 업데이트
        memberlist[index] = MemberData(memberImage: updatedImageName, memberNum: updatedNum, memberName: updatedName, memberAge: updatedAge, memberTell: updatedTel, memberAddress: updatedAddress)
              

        self.navigationController?.popViewController(animated: true)
    }
    
    func saveImageToDocuments(image: UIImage) -> String {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = urls[0]
        let imageName = UUID().uuidString + ".png"
        let imageURL = documentsDirectory.appendingPathComponent(imageName)
        
        if let data = image.pngData() {
            try? data.write(to: imageURL)
        }
        
        return imageName
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
            selectedImage = pickedImage
            imgBtn.setImage(pickedImage.withRenderingMode(.alwaysOriginal), for: .normal)
            imgBtn.imageView?.contentMode = .scaleAspectFill
            imgBtn.clipsToBounds = true
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
