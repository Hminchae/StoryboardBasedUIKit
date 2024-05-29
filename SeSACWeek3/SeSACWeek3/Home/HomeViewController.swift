//
//  HomeViewController.swift
//  SeSACWeek3
//
//  Created by 황민채 on 5/28/24.
//

import UIKit

/*
 1. tableView 아울렛 선언
 2. UITableViewDelegate 와 UITableViewDataSource - 2개
 3. delegate = self, datasource = self
 */


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var userTextfield: UITextField!
    
    @IBOutlet weak var firstFilterButton: UIButton!
    @IBOutlet weak var secondFilterButton: UIButton!
    @IBOutlet weak var thirdFilterButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var buttonList = [firstFilterButton, secondFilterButton, thirdFilterButton] // 나중에 초기화하겠다~

    let list = TravelInfo.travel
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SampleTableViewCell.identifier, for:indexPath) as! SampleTableViewCell
        
        let data = list[indexPath.row]
        cell.configureCell(data)
//        cell.selectionStyle = .none -> 눌렀을 때 스타일
        return cell
    }

    func configareTableView() {
//        tableView.isUserInteractionEnabled = false
//        tableView.allowsSelection = false
        
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: SampleTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: SampleTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView("홈")
        configareTableView()
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // 셀을 클릭했는데 동작을 안 한다면?
    // - print 로 확인
    // - delegate, datasource = self 빠뜨리지 않았아..
    // - 연결이 안 되어 있거나..
    // - 테이블뷰나 셀이 클릭이 되는 상태인지.. interaction/selection
    // - 클릭되는 컨트롤 들이 위에 있는 상태인지
    // - 제스처 중첩 : 만약 셀 클릭 + 셀에 탭제스처, 테이블 뷰 탭제스처
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath)
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        // 3. 화면 띄우기
        present(vc, animated: true)
    }
}


