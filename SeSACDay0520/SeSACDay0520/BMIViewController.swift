//
//  BMIViewController.swift
//  SeSACDay0520
//
//  Created by 황민채 on 5/22/24.
//

import UIKit

class BMIViewController: UIViewController {
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkButton.addTarget(self,
                              action: #selector(checkButtonClicked),
                              for: .touchUpInside)
    }
    
    @objc
    func checkButtonClicked() {
        
        // 1. optinal binding : if let
        // height의 범위가 제한적
        
//        if let height = heightTextField.text,
//           let weight = heightTextField.text{
//            let result = "키 \(height), 몸무게 \(weight)"
//        }
        
        
        // 1. else 를 먼저 처리
        // 2. 변수 활용 범위
        // 3. early exit
        guard let height = heightTextField.text,
        let weight = weightTextField.text else {
            resultLabel.text = "nil 입니다."
            return
        }
        guard height.count > 3 else {
            resultLabel.text = "3자리 이상 입력해주세요"
            return
        }
        resultLabel.text = "키: \(height)"
        
    }
}
