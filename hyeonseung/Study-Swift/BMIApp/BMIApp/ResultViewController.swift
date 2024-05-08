//
//  ResultViewController.swift
//  BMIApp
//
//  Created by 한현승 on 4/18/24.
//
import UIKit
import Foundation

class ResultViewController : UIViewController{
  
    @IBOutlet weak var bmiLbl: UILabel!
  
    @IBOutlet weak var statusLbl: UILabel!
    

    var bmi: String?
    var status: String?

   
    @IBAction func exitResult(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let bmi = bmi {
            bmiLbl.text = bmi
        //    bmiLbl.sizeToFit()
        }
        
        guard let status = status else {return}
        statusLbl.text =  "\(status)입니다"
        statusLbl.textAlignment = .center
        statusLbl.center = self.view.center
     //   statusLbl.sizeToFit()
        statusLbl.layer.cornerRadius = 10
        statusLbl.clipsToBounds = true
        
        if status == "비만" {
            statusLbl.backgroundColor = UIColor.red
        }
        else if status == "과제중"{
            statusLbl.backgroundColor = UIColor.orange
        }
        else if status == "정상체중" {
            statusLbl.backgroundColor = UIColor.green
        }
        else {
            statusLbl.backgroundColor = UIColor.systemBlue
        }
        
         
    }
    

    
    
}
