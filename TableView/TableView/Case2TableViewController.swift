//
//  Case2TableViewController.swift
//  TableView
//
//  Created by 황민채 on 5/23/24.
//

import UIKit

class Case2TableViewController: UITableViewController {
    
    let all = ["공지사항", "실험실", "버전 정보"]
    let personal = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let etc = ["고객센터/도움말"]
    
    @IBOutlet weak var allGroupTitle: UILabel!
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .darkGray
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        var result: Int = 0
        
        if section == 0 {
            result =  all.count
        } else if section == 1 {
            result =  personal.count
        } else if section == 2 {
            result =  etc.count
        }
        
        return result
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 2. 셀의 높이(약간 필수 권장...)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(#function)
        return 40
    }
    
    // 3. 셀의 디자인 및 데이터 처리
    // ex. 카카오톡 친구 이름. 프로필 사진. 상태 메시지 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        // 3-1. 어떤 셀을 쓸 지 결정
        // 재사용 메커니즘
        let cell = tableView.dequeueReusableCell(withIdentifier: "case2")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = all[indexPath.row]
            cell.textLabel?.textColor = .label
            cell.textLabel?.font = .systemFont(ofSize: 13)
            cell.separatorInset.bottom = .greatestFiniteMagnitude

        } else if indexPath.section == 1 {
            cell.textLabel?.text = personal[indexPath.row]
            cell.textLabel?.textColor = .label
            cell.textLabel?.font = .systemFont(ofSize: 13)
        } else {
            cell.textLabel?.text = etc[indexPath.row]
            cell.textLabel?.textColor = .label
            cell.textLabel?.font = .systemFont(ofSize: 13)
        }
    
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var result: String?
        
        if section == 0 {
            result =  "전체 설정"
        } else if section == 1 {
            result =  "개인 설정"
        } else if section == 2 {
            result =  "기타"
        }
        
        return result
    }

}
