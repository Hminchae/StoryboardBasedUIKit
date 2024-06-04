//
//  ConstraintsViewController.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/4/24.
//

import UIKit

/*
 ✏️ 코드로 오토레이아웃 잡기..
 1. Autoresizing
 2. NSlayoutConstraint
 - isActive
 - addConstraints
 3. NSLayoutAcchor
 */

/*
 ✏️
 Adaptive Layout
 - Size Class : 아이폰이나 아이패드의 기종에 따라 Regular, Compact
 - Trait Collection : 다크모드/ 라이트모드 대응
 - Universial :
 */
class ConstraintsViewController: UIViewController {
    
    let emailTextField = UITextField()
    let signButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(emailTextField)
        view.addSubview(signButton)
        
        // 👾 emailTextField 실습 -  2. NSlayoutConstraint
        // emailTextField.autoresizingMask = [.flexibleTopMargin]
        emailTextField.translatesAutoresizingMaskIntoConstraints = false // 오토리사이징 안 쓸래
        emailTextField.backgroundColor = .red
        
        // 💡 경고 이유 : .isActive = true 없어서!
        let top = NSLayoutConstraint(item: emailTextField,
                                     attribute: .top, // 뭐잡을까?
                                     relatedBy: .equal,
                                     toItem: view.safeAreaLayoutGuide,
                                     attribute: .top,
                                     multiplier: 1,
                                     constant: 0)
        
        let leading = NSLayoutConstraint(item: emailTextField,
                                         attribute: .leading, // 뭐잡을까?
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .leading,
                                         multiplier: 1,
                                         constant: 50)
        
        let trailing = NSLayoutConstraint(item: emailTextField,
                                          attribute: .trailing, // 뭐잡을까?
                                          relatedBy: .equal,
                                          toItem: view,
                                          attribute: .trailing,
                                          multiplier: 1,
                                          constant: -50)
        
        let height = NSLayoutConstraint(item: emailTextField,
                                        attribute: .height, // 뭐잡을까?
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .height,
                                        multiplier: 1,
                                        constant: 50)
        // ➕다른 방법도 있음
        //        top.isActive = true
        //        leading.isActive = true
        //        trailing.isActive = true
        //        height.isActive = true
        // 8.0 이상부터 addCnstraints 사용 O
        
        view.addConstraints([top, leading, trailing, height])
        
        // 👾 signButton 실습 -   3. NSLayoutAcchor
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.backgroundColor = .orange
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
