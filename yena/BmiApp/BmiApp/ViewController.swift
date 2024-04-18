//
//  ViewController.swift
//  BmiApp
//
//  Created by inuappcenter on 4/17/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var bmititle: UILabel!
    @IBOutlet weak var bmiheight: UILabel!
    @IBOutlet weak var bmiweight: UILabel!
    
    @IBOutlet weak var heighttxt: UITextField! // 키 입력 텍스트 필드
    @IBOutlet weak var weighttxt: UITextField! // 몸무게 입력 텍스트 필트
    
    var bmi : Double? // BMI를 계산한 값을 appdelegate에 저장(저장소 역할은 아니지만 잠시 저장해놓음)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func bmiButton(_ sender: UIButton) { // bmi 계산 버튼 - 화면 전환
//        print(#function)
//        calculBmi()
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
            // 항상 식별자 먼저 확인
        calculBmi()

        if segue.identifier == "SecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.modalPresentationStyle = .fullScreen
            
            // 다음화면으로 데이터 전달
            if let bmiResult = bmi {
                secondVC.bmi = String(bmiResult)
            }
            secondVC.colorSetting = colorChange()
            secondVC.bodySize = bodySize()
        }
        // 다음화면으로 가기전에 텍스트필드 비우기
//            heighttxt.text = ""
//            weighttxt.text = ""
    }
    
    func calculBmi(){
        if let hValue = heighttxt.text), let wValue = (weighttxt.text) {
            
        }
        
        let height = Double(heighttxt.text!)! // 입력받은 텍스트를 double로 변환
        let weight = Double(weighttxt.text!)!
        bmi = weight / (height*height*0.001) //bmi = 체중/키의 제곱
        print("BMI: \(bmi)")
    }
    
    func colorChange() -> UIColor { // 체중에 따른 색깔 분배
        guard let bmi = bmi else {return UIColor.black} //초기값
        switch bmi {
        case 0.0..<18.5:
            return UIColor(_colorLiteralRed: 0.0, green: 0.1, blue: 0.0, alpha: 0.1)
        case 18.5..<25.0 :
            return UIColor(displayP3Red: 0.0, green: 0.0, blue: 1.0, alpha:  1.0)
        case 25.0..<30.0 :
            return UIColor(displayP3Red: 0.4, green: 0.0, blue: 0.0, alpha:  1.0)
        case 30.0..<40.0 :
            return UIColor(displayP3Red: 0.7, green: 0.0, blue: 0.0, alpha:  1.0)
        default :
            return UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha:  1.0)
        }
    }
    
    func bodySize() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi{
        case 0.0..<18.5:
            return "저체중"
        case 18.5..<25.0 :
            return "표준체중"
        case 25.0..<30.0 :
            return "과체중"
        case 30.0..<40.0 :
            return "중도비만"
        default :
            return ""
        }
    }
}

