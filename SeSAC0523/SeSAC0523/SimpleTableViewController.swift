//
//  SimpleTableViewController.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/23/24.
//

import UIKit

class SimpleTableViewController: UITableViewController {
    var list = ["iOS", "iPadOS", "watchOS", "기타"]
    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()

    }
    // 1. 셀의 갯수(필수)
    // ex. 카카오톡 100명
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count
    }
    
    // 2. 셀의 높이(약간 필수 권장...)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(#function)
        return 80
    }
    
    // 3. 셀의 디자인 및 데이터 처리
    // ex. 카카오톡 친구 이름. 프로필 사진. 상태 메시지 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        // 3-1. 어떤 셀을 쓸 지 결정
        // 재사용 메커니즘
        let cell = tableView.dequeueReusableCell(withIdentifier: "thanky")!
        cell.imageView?.image = UIImage(systemName: "star.fill")
        cell.imageView?.tintColor = .magenta
        
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.textColor = .brown
        cell.textLabel?.font = .boldSystemFont(ofSize: 30)
        
        cell.detailTextLabel?.text = "iOS 앱 개발자 데뷔과정"
        cell.detailTextLabel?.textColor = .lightGray
        cell.detailTextLabel?.font = .boldSystemFont(ofSize: 20)
        
        return cell
    }
}
