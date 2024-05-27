import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var bmiSecondtitle: UILabel! //제목
    
    // 전 화면에서 데이터 전달받기 위한 변수
    var bmi : String?
    var bodySize : String?
    var colorSetting : UIColor?
    @IBOutlet weak var performanceBmi: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let bmiResult = bmi {
            performanceBmi.text = bmi
        }
        
    }
    
    @IBAction func back(_ sender: UIButton) { //전 화면으로 돌아가기
        self.presentingViewController?.dismiss(animated: true) //present를 쓴다면 return이 아닌 덮어서 표시하기임
    }
}
