
import UIKit

class AddMemberViewController: UIViewController{

    let imgPicker = UIImagePickerController()
    
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
    
    @IBOutlet var selectedImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgBtn.layer.masksToBounds = true
        self.imgBtn.layer.cornerRadius = self.imgBtn.frame.size.width / 2
        self.imgBtn.layer.backgroundColor =  UIColor.lightGray.cgColor
       
        self.imgPicker.delegate = self

        memberNum.text = "멤버번호: "
        memberName.text = "이     름: "
        memberAge.text = "나     이: "
        memberTel.text = "전화번호: "
        memberAddress.text = "주     소: "
    
        setupView()
        
    }
    
    func setupView() {
        imgBtn.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
     
    }
  
    @IBAction func uploadPhoto(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
            
    }
    
    
    @IBAction func saveMember(_ sender: Any) {
        
        let num = numTF.text ?? ""
        let name = nameTF.text ?? ""
        let age = ageTF.text ?? ""
        let tel = telTF.text ?? ""
        let address = addressTF.text ?? ""
        
        if selectedImage?.image == nil {
            let defaultImages = ["basic_profile", "basic_profile2"]
            let randomIndex = Int(arc4random_uniform(UInt32(defaultImages.count)))
            selectedImage?.image = UIImage(named: defaultImages[randomIndex])
        }
        
        let imageName = selectedImage?.image
        
      
        let data = MemberData(memberImage: imageName, memberNum: num, memberName: name, memberAge: age, memberTell: tel, memberAddress: address)
        
        MemberManager.shared.addMember(data)
        
        print("memberlist count: \(MemberManager.shared.countMember())")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}

extension AddMemberViewController:
    UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
           
            selectedImage?.image = pickedImage
            selectedImage?.layer.cornerRadius = (self.selectedImage?.frame.height)!/2
            selectedImage?.clipsToBounds = true
            selectedImage?.contentMode = .scaleToFill
            
            imgBtn.setImage(pickedImage, for: .normal)
            imgBtn.imageView?.contentMode = .scaleAspectFill
            imgBtn.clipsToBounds = true
        }
        
        dismiss(animated: true, completion: nil)
       }
  
    
   func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       dismiss(animated: true, completion: nil)
   }
}
