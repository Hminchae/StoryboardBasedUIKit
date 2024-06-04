//
//  SnapViewController.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/4/24.
//

import UIKit
import SnapKit

/*
 1. 필요성
 2. HTTP vs Socket
 3. HTTP : 클라이언트가 항상 먼저 요청을 하고, 서버가 응답을 한다.
 
 */
class SnapViewController: UIViewController {
    
    let photoImageView = UIImageView()
    let titleTextField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요."
        view.backgroundColor = .lightGray
        view.textAlignment = .center
        view.borderStyle = .none
        return view
    }()
    
    let dateTextField = UITextField()
    let contentTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy() // 1️⃣
        configureLayout() // 2️⃣
        configureUI()
    }
    
    func configureHierarchy() {
        let array = [photoImageView, titleTextField, dateTextField, contentTextField]
//        view.addSubview(photoImageView)
//        view.addSubview(titleTextField)
//        view.addSubview(dateTextField)
//        view.addSubview(contentTextField)
        for i in array {
            view.addSubview(i)
        }
    }
    
    func configureLayout() {
        photoImageView.snp.makeConstraints { make in // make : 이미지뷰
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(300)
        }
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
        contentTextField.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    
    func configureUI() {
        view.backgroundColor = .white
        
        photoImageView.backgroundColor = .lightGray
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.image = UIImage(systemName: "person.fill")
 
        dateTextField.backgroundColor = .orange
        
        contentTextField.backgroundColor = .yellow
    }
}
