//
//  FrameViewController.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/4/24.
//

import UIKit
// 1. Storyboard Scene > 2. Swift File (Cocoa Touch Class) > 3. Storyboard 에서 연결
// 코드베이스를 시작하는 방법은 위 1, 3번을 제거한 과정
// 1. Swift File

// Frame Based Layout > Auto Layout > Adaptive Layout
// Frame Based Layout: 뷰 위치와 크기를 직접 지정
// 💡 Auto resizing -> 오토레이아웃 적용하면 이 기능 사라짐
// -> Autoresizing 설정을 하면 Autoresizing 기반으로 Constraints 가 잡힘 >> 따라서 뷰의 크기나 위치를 수정하기 위해서 추가적으로 Constraints 제약조건 설정하는 것은 불가능, 충돌될 수 있기 때문에
class FrameViewController: UIViewController {
    // 1️⃣ 뷰 객체 프로퍼티 선언 (클래스 인스턴스)
    let emailTextField = UITextField()
    let signButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white // 뷰 배경색 설정
        
        // 2️⃣ 루트뷰에 뷰 추가
        // 늦게 추가될수록 위에 있음
        // 뷰 계층 순서 유의
        view.addSubview(emailTextField)
        view.addSubview(signButton)
        
        // 3️⃣ 뷰 객체의 크기와 위치 설정
        emailTextField.frame = CGRect(x: 100, y: 100, width: 300, height: 50)
        emailTextField.backgroundColor = .yellow
        let width = UIScreen.main.bounds.width
        signButton.frame = CGRect(x: 300, y: 100, width: width - 100 , height: 50)
        signButton.backgroundColor = .green
    }
}
