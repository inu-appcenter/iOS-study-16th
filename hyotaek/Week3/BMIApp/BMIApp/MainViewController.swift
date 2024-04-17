import UIKit

// 키보드 숨기기
extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // TextField 비활성화
        return true
    }
}

class MainViewController: UIViewController {
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    
    @IBAction func bmiCalculate(_ sender: Any) {
        guard let height = heightInput.text else { return }
        guard let weight = weightInput.text else { return }
        
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.height = Double(height)
        resultVC.weight = Double(weight)
        self.present(resultVC, animated: true, completion: nil)
        
        heightInput.text = ""
        weightInput.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightInput.delegate = self
        weightInput.delegate = self
        
        heightInput.placeholder = "cm 단위로 입력해주세요"
        weightInput.placeholder = "kg 단위로 입력해주세요"
    }


}

