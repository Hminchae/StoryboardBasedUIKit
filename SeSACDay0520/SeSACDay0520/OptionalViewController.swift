//
//  OptionalViewController.swift
//  SeSACDay0520
//
//  Created by 황민채 on 5/20/24.
//

import UIKit

class OptionalViewController: UIViewController {
    
    @IBOutlet weak var nicknameTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = UserDefaults.standard.string(forKey: "nickname")
        
        print(name)
        nicknameTextfield.text = name
        
        UserDefaults.standard.string(forKey: "jack")
        
    }
    // TODO: 키보드 내리기
    // 1. 바탕 탭제스처
    // 2. return
    // 3. 버튼클릭 시
    
    // Any를 사용하는 예
    // 같은 액션을 다중 버튼 & 제스처가 담당할 때
    @IBAction func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
        print()
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        // 진짜 저장하기
        UserDefaults.standard.set(nicknameTextfield.text, forKey: "nickname")
    }
}
