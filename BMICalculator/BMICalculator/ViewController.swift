//
//  ViewController.swift
//  BMICalculator
//
//  Created by 황민채 on 5/22/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var bmiImageView: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var randomCalculatorButton: UILabel!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var weightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "BMI Calculator"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        
        subTitleLabel.text = "당신의 BMI 지수를 알려드릴게요."
        subTitleLabel.numberOfLines = 2
        subTitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        bmiImageView.image = UIImage(named: "image")
        bmiImageView.contentMode = .scaleAspectFit
        
        heightLabel.text = "키가 어떻게 되시나요?"
        
        heightTextField.borderStyle = .roundedRect
        
        weightLabel.text = "몸무게는 어떻게 되시나요?"
        weightTextField.borderStyle = .roundedRect
        
        resultButton.setTitle("결과확인", for: .normal)
        resultButton.tintColor = .white
        resultButton.backgroundColor = .purple
        resultButton.layer.cornerRadius = 15
        
        randomCalculatorButton.text = "랜덤으로 BMI 계산하기"
        randomCalculatorButton.textColor = .red
        
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
    }

}

