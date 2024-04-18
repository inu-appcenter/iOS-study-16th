//
//  ViewController.swift
//  BMIApp
//
//  Created by 한현승 on 4/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 아웃렛 변수 : 객체에 연결하여 접근할 수 있는 변수
    @IBOutlet weak var height_txt: UITextField!
    
    @IBOutlet weak var weight_txt: UITextField!
    
    var bmi: String?
    var status: String?
 
    //BMI 계산 함수
    func calc(w: UITextField, h: UITextField){
     
        //암시적 추출 지양!
//        var weight = Double(weight_txt.text!)! ;
//        var height = Double(height_txt.text!)! ;
        
        guard let weight = Double(w.text!) else {return}
        guard let height = Double(h.text!) else {return}
      
        let bmi = weight/((height/100)*(height/100))

        if bmi >= 25 {
            status = "비만"
        }
        else if bmi >= 23 && bmi < 25 {
            status = "과체중"
        }
        else if bmi >= 18.5 && bmi < 23 {
            status = "정상체중"
        }
        else {
            status = " 저체중"
        }
        
        let short_bmi = String(format: "%.2f", bmi)
        
        self.bmi = short_bmi
        print("BMI : \(short_bmi)")
        
    
    }
    
    // 액션 함수 : 객체가 수행할 내용
    @IBAction func submit_btn(_ sender: Any) {
      
       
//        // storyboard가 아닌 코드로 직접 구현) 프로퍼티에 직접 접근
//        guard let resultViewController = self.storyboard?.instantiateViewController(identifier: "ResultVC") as? ResultViewController else {return}
//        calc(w: weight_txt, h: height_txt)
        
//        resultViewController.bmi = String(bmi)
//        present(resultViewController, animated: true)
//            resultViewController.status = result

    }
    
    // segue로 구현시)  실행 전 전달하려는 데이터
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        calc(w: weight_txt, h: height_txt)
       
        // 암시적 추출 지양
        // let vc = segue.destination as! ResultViewController
        guard let vc = segue.destination as? ResultViewController else {return}
        vc.bmi = self.bmi
        vc.status = self.status
    }
    
    @IBAction func moveSegue(segue:UIStoryboardSegue){
        
    }
}

