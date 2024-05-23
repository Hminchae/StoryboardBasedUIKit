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
    @IBOutlet weak var randomCalculatorButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var myName: UILabel!
    var myNameID: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        myName.text = "안녕하세요 \(myNameID ?? "게스트")님!"
        titleLabel.text = "BMI Calculator"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        
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
        
        randomCalculatorButton.setTitle("랜덤으로 BMI 계산하기", for: .normal)
        randomCalculatorButton.tintColor = .red
        
        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        
    }
    func configureNavigationItem() {
        let profile = UIBarButtonItem(
            image: UIImage(systemName: "person.fill")?.withTintColor(.purple),
            style: .plain,
            target: self,
            action: #selector(profileButtonClicked))
        
       // navigationItem.title = "땡키 계산기"
        navigationItem.rightBarButtonItem = profile
    }
    @objc
    func profileButtonClicked() {
        // 우상단 네비게이션 아이템 세팅
        let alert = UIAlertController(
            title: "닉네임 설정",
            message: nil,
            preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "이름을 입력하세요"
            textField.textColor = .purple
        }

        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel)
        let save = UIAlertAction(
            title: "저장",
            style: .default) { action in
                self.myNameID = alert.textFields?[0].text
                self.myName.text = "안녕하세요 \(self.myNameID ?? "")님!"
            }
        
        alert.addAction(cancel)
        alert.addAction(save)
        
        present(alert, animated: true)
    }

}

