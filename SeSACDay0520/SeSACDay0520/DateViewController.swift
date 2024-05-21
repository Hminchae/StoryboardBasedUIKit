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
        
        navigationItem.title = randomTitle()
        navigationItem.leftBarButtonItems = [menu, profile]
    }
    
    @discardableResult // return 값 안 쓸 수도 있을 때! 굳이 워딩을 띄우지 않도록 하는 atributer
    func randomTitle() -> String { // 매개변수는 없지만 반환값은 있는 함수
        let list = ["고래밥", "칙촉", "꼬물탱", "카스타드"]
        let random = list.randomElement()!
        let result = "\(random) 계산기"
        print(#function)
        return result
        // return 이후의 코드는 실행되지 않음
    }
    
    func configureDatePicker() { // 매개변수는 없지만 반환값도 없는 함수
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
    }
    
    // @objc = swift 로 작성하였지만, objc 로 변경해주는 호환작업
    @objc func starButtonClicked() {
        print(#function) // -> 함수의 이름이 출력되게 됨
        
        let picker = UIColorPickerViewController()
        present(picker, animated: true)
    }
    
    @objc func profileButtonClicked() {
        // 1.
        let alert = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet)
        
        // 2.
        let open = UIAlertAction(
            title: "열기",
            style: .default)
        let delete = UIAlertAction(
            title: "삭제",
            style: .destructive)
        let cancel = UIAlertAction(
            title: "취소",
            style: .cancel)
        
        // 3.
        alert.addAction(cancel)
        alert.addAction(delete)
        alert.addAction(open)
        
        // 4.
        present(alert, animated: true)
    }
    // DatePicker
    // ------------------------
    // DateFormat: 영국 표준시 기준
    // 1) 시간대 2) 표기
    // yyyy MM dd mm ss a:오전오후 EEEE:요일
    // YY와 yy는 다르다.
    @IBAction func datePickerTapped(_ sender: UIDatePicker) { // 매개변수는 있지만 반환값도 없는 함수
        print(datePicker.date)
        let format = DateFormatter()
        format.dateFormat = "yyyy/M/d/a/E"
        // 24년 5월 1일 : yy년 M월 d일
        day100Label.text = format.string(from: sender.date)
    }
}
