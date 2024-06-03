//
//  AddEditViewController.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/3/24.
//

import UIKit

// 휴먼 에러 방지, 컴파일 타임에서 오류 처리가 가능함
// case로 선택지를 만들지만..
// rawValue 설정
// 멤버와 값의 분리 : rawValue

enum ViewType: String {
    case add = "추가하기"
    case edit = "편집하기"
    
    var placeholder: String {
        switch self {
        case .add:
            return "등록할 이름을 입력해주세요"
        case .edit:
            return "수정할 이름을 입력해주세요"
        }
    }
}

class AddEditViewController: UIViewController {
    
    var titleValue: String = ""
    var placeholder: String = ""
    var type: ViewType = .add // 0번이면 추가화면, 1번이면 편집화면으로

    @IBOutlet weak var topTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch type {
        case .add :
            navigationItem.title = ViewType.add.rawValue
            topTextField.placeholder = ViewType.add.placeholder
        case .edit :
            navigationItem.title = ViewType.edit.rawValue
            topTextField.placeholder = ViewType.edit.placeholder
        }
        configureBarButtonItem()
    }

    func configureBarButtonItem() {
        let item = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func saveButtonClicked() {
        
        // 화면 종류에 따른 분기처리
        switch type {
        case .add :
            dismiss(animated: true)
        case .edit :
            navigationController?.popViewController(animated: true)
        }
    }
}
