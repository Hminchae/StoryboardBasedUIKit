//
//  CalculateViewController.swift
//  SeSACDay0520
//
//  Created by 황민채 on 5/22/24.
//

import UIKit

class CalculateViewController: UIViewController {

    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 1.Optional Chaning
        // 2.Optional Binding
        
        var nickname: String? = "고래밥"
        
        // nick name = nil
        
        if nickname == nil {
            print("손님")
        } else {
            print(nickname!)
        }
        
        // 5.7+ if let shorthand
        if let nickname {
            print(nickname)
        } else {
            print("손님")
        }

    }

    // Event - EditingChanged
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        // Optional Binding
        
        // 1. 텍스트필드 텍스트가 nil 일 수 있음
        let text = sender.text ?? ""
        
        // 2. 텍스트가 숫자로 바뀌지 않을 수 있음
//        if Int(text) != nil {
//            let value = Int(text)!
//            resultLabel.text = "\(value)"
//        } else {
//            resultLabel.text = "숫자만 입력해주세요"
//        }
        // -> 바인딩
        if let value = Int(text) {
            resultLabel.text = "\(value)"
        } else {
            resultLabel.text = "숫자만 입력해주세요"
        }
//        // count 가 Int 인데, 왜 상수는 Int? 일까?
//        let count: Int = sender.text?.count ?? 0
//        resultLabel.text = "\(count)"
        
        
    }
}
