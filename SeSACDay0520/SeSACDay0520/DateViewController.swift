//
//  DateViewController.swift
//  SeSACDay0520
//
//  Created by 황민채 on 5/22/24.
//

import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var day100Label: UILabel!
    @IBOutlet weak var day200Label: UILabel!
    @IBOutlet weak var day300Label: UILabel!
    @IBOutlet weak var day400Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDatePicker()
        configureNavigationItem()
        
        day100Label.numberOfLines = 0
        
        datePickerTapped(datePicker) //  화면이 떴을때 이 기능을 미리 세팅해줘
    }
    
    func configureNavigationItem() {
        let menu = UIBarButtonItem(
            image: UIImage(systemName: "heart.fill"),
            style: .plain,
            target: self,
            action: #selector(starButtonClicked))
        
        let profile = UIBarButtonItem(
            title: "프로필",
            style: .plain,
            target: self,
            action: #selector(profileButtonClicked))
        
        navigationItem.title = "땡키 계산기"
        navigationItem.leftBarButtonItems = [menu, profile]
    }
    
    func configureDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
    }
    
    // @objc = swift 로 작성하였지만, objc 로 변경해주는 호환작업
    @objc func starButtonClicked() {
        print(#function) // -> 함수의 이름이 출력되게 됨
    }
    
    @objc func profileButtonClicked() {
        print(#function) // -> 함수의 이름이 출력되게 됨
    }
    // DatePicker
    // ------------------------
    // DateFormat: 영국 표준시 기준
    // 1) 시간대 2) 표기
    // yyyy MM dd mm ss a:오전오후 EEEE:요일
    // YY와 yy는 다르다.
    @IBAction func datePickerTapped(_ sender: UIDatePicker) {
        print(datePicker.date)
        let format = DateFormatter()
        format.dateFormat = "yyyy/M/d/a/E"
        // 24년 5월 1일 : yy년 M월 d일
        day100Label.text = format.string(from: sender.date)
    }
    
}
