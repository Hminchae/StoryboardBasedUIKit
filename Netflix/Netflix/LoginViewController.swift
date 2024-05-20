//
//  LoginViewController.swift
//  Netflix
//
//  Created by 황민채 on 5/17/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTitleLabel: UILabel!
     
    @IBOutlet var textFieldCollection: [UITextField]!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var addInfoLabel: UILabel!
    @IBOutlet weak var addInfoSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTitleLabel.text = "JACKFLIX"
        loginTitleLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        loginTitleLabel.textColor = .red
        loginTitleLabel.textAlignment = .center
        
        designLoginTextField(textFieldCollection[0], placeholder: "이메일 주소 또는 전화번호")
        designLoginTextField(textFieldCollection[1], placeholder: "비밀번호")
        textFieldCollection[1].isSecureTextEntry = true
        designLoginTextField(textFieldCollection[2], placeholder: "닉네임")
        designLoginTextField(textFieldCollection[3], placeholder: "위치")
        designLoginTextField(textFieldCollection[4], placeholder: "추천 코드 입력")
        
        signInButton.setTitle("회원가입", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.backgroundColor = .white
        signInButton.cornerRadius = 5
        
        addInfoLabel.textColor = .white
        addInfoLabel.text = "추가 정보 입력"
        
        addInfoSwitch.onTintColor = .red
    }
    
    func designLoginTextField(_ textFieldName : UITextField,
                              placeholder: String
    ) {
        textFieldName.placeholder = placeholder
        textFieldName.backgroundColor = .gray
        textFieldName.textColor = .white
        textFieldName.tintColor = .white
        textFieldName.font = .systemFont(ofSize: 16, weight: .medium)
        textFieldName.cornerRadius = 5
        textFieldName.textAlignment = .center
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        for i in 0...4 {
            textFieldCollection[i].endEditing(true)
        }
    }
}
