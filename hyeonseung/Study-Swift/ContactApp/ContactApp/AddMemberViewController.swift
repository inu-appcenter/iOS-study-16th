
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
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgBtn.layer.masksToBounds = true
        self.imgBtn.layer.cornerRadius = self.imgBtn.frame.size.width / 2
        self.imgBtn.layer.backgroundColor =  UIColor.lightGray.cgColor
        self.imgBtn.setTitle("", for: .normal)
       
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
        // imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
            
    }
    
    
    @IBAction func saveMember(_ sender: Any) {
        
        let num = numTF.text ?? ""
        let name = nameTF.text ?? ""
        let age = ageTF.text ?? ""
        let tel = telTF.text ?? ""
        let address = addressTF.text ?? ""
        
        let imageName = selectedImage == nil ? "defaultImage" : saveImageToDocuments(image: selectedImage!)

        let data = MemberData(memberImage: imageName, memberNum: num, memberName: name, memberAge: age, memberTell: tel, memberAddress: address)
        
        memberlist.append(data)
        
        print("memberlist count: \(memberlist.count)")
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

extension AddMemberViewController:
    UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
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
    
