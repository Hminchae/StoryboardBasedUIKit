//
//  LoginViewController.swift
//  Netflix
//
//  Created by 황민채 on 5/17/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTitleLabel: UILabel!
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var recomendCodeTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var addInfoLabel: UILabel!
    @IBOutlet weak var addInfoSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTitleLabel.text = "JACKFLIX"
        loginTitleLabel.font = .systemFont(ofSize: 30, weight: .heavy)
        loginTitleLabel.textColor = .red
        
        emailTextField.placeholder = "이메일 주소 또는 전화번호"
        emailTextField.backgroundColor = .gray
        emailTextField.textColor = .white
        emailTextField.tintColor = .white
        emailTextField.font = .systemFont(ofSize: 16, weight: .medium)
        emailTextField.cornerRadius = 5
        emailTextField.textAlignment = .center
        
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.backgroundColor = .gray
        passwordTextField.textColor = .white
        passwordTextField.tintColor = .white
        passwordTextField.font = .systemFont(ofSize: 16, weight: .medium)
        passwordTextField.cornerRadius = 5
        passwordTextField.textAlignment = .center
        passwordTextField.isSecureTextEntry = true
        
        nickNameTextField.placeholder = "닉네임"
        nickNameTextField.backgroundColor = .gray
        nickNameTextField.textColor = .white
        nickNameTextField.tintColor = .white
        nickNameTextField.font = .systemFont(ofSize: 16, weight: .medium)
        nickNameTextField.cornerRadius = 5
        nickNameTextField.textAlignment = .center
        
        locationTextField.placeholder = "위치"
        locationTextField.backgroundColor = .gray
        locationTextField.textColor = .white
        locationTextField.tintColor = .white
        locationTextField.font = .systemFont(ofSize: 16, weight: .medium)
        locationTextField.cornerRadius = 5
        locationTextField.textAlignment = .center
        
        recomendCodeTextField.placeholder = "추천 코드 입력"
        recomendCodeTextField.backgroundColor = .gray
        recomendCodeTextField.textColor = .white
        recomendCodeTextField.tintColor = .white
        recomendCodeTextField.font = .systemFont(ofSize: 16, weight: .medium)
        recomendCodeTextField.cornerRadius = 5
        recomendCodeTextField.textAlignment = .center
        
        signInButton.setTitle("회원가입", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.backgroundColor = .white
        signInButton.cornerRadius = 5
        
        addInfoLabel.textColor = .white
        addInfoLabel.text = "추가 정보 입력"
        
        addInfoSwitch.onTintColor = .red
        
    }
    @IBAction func signInAction(_ sender: UIButton) {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        nickNameTextField.endEditing(true)
        locationTextField.endEditing(true)
        recomendCodeTextField.endEditing(true)
    }
}
