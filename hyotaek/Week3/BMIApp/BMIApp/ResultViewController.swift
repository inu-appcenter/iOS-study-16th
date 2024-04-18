import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var bmiResult: UILabel!      // BMI 숫자 값 label
    @IBOutlet weak var resultMessage: UILabel!  // 저체중, 정상 등 BMI 결과 메시지 label
    
    var height: Double?
    var weight: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MainViewController에서 받은 height, weight 옵셔널 바인딩
        guard let height = height else { return }
        guard let weight = weight else { return }
        
        let bmi = weight / pow(height / 100, 2)
        let bmiString = String(format: "%.1f", bmi)
        
        bmiResult.text = bmiString
        bmiResult.layer.cornerRadius = 10
        bmiResult.clipsToBounds = true
        
        switch bmi {
        case 0..<18.5:
            self.resultMessage.text = "저체중"
            self.bmiResult.backgroundColor = UIColor(red: 2/255, green: 139/255, blue: 250/255, alpha: 1)
        case 18.5..<22.9:
            self.resultMessage.text = "정상"
            self.bmiResult.backgroundColor = UIColor(red: 127/255, green: 209/255, blue: 4/255, alpha: 1)
        case 23..<25:
            self.resultMessage.text = "과체중"
            self.bmiResult.backgroundColor = UIColor(red: 252/255, green: 140/255, blue: 3/255, alpha: 1)
        case 25...:
            self.resultMessage.text = "위험 체중"
            self.bmiResult.backgroundColor = UIColor(red: 217/255, green: 63/255, blue: 2/255, alpha: 1)
        default:
            self.resultMessage.text = "잘못된 입력입니다. 키와 몸무게를 다시 입력해주세요"
            self.bmiResult.backgroundColor = UIColor(red: 252/255, green: 232/255, blue: 3/255, alpha: 1)
        }
    }
    
    // ResultViewController를 가져와서 있다면 dimiss()로 현재 화면 닫음
    @IBAction func reCalculate(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
