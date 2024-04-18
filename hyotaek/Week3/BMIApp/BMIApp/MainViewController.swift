import UIKit

class MainViewController: UIViewController {
    // 키, 몸무게 입력 TextField
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    
    // MainViewController가 로드된 후 호출되는 초기 설정
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITextFieldDelegate 프로토콜 채택 후, TextField에 이벤트 발생 시 MainViewController에 위임
        heightInput.delegate = self
        weightInput.delegate = self
        
        heightInput.placeholder = "cm 단위로 입력해주세요"
        weightInput.placeholder = "kg 단위로 입력해주세요"
    }
    
    // BMI 계산 버튼 눌렀을 때 실행
    @IBAction func bmiCalculate(_ sender: Any) {
        // 키, 몸무게 TextField에서 입력된 텍스트를 각각 height, weight에 저장 (옵셔널 바인딩)
        guard let height = heightInput.text else { return }
        guard let weight = weightInput.text else { return }
        
        // resultVC에 인스턴스화 시도.
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {return}
        
        // resultVC의 height, weight 속성에 Double타입의 값 할당
        resultVC.height = Double(height)
        resultVC.weight = Double(weight)
        
        // 현재 viewController에서 resultVC로 전환
        self.present(resultVC, animated: true, completion: nil)
        
        // 화면 전환 후 TextField에 입력된 텍스트 제거
        heightInput.text = ""
        weightInput.text = ""
    }
}

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
