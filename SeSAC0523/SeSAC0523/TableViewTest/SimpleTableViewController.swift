//
//  SimpleTableViewController.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/23/24.
//

import UIKit

class SimpleTableViewController: UITableViewController {
    let list = ["iOS", "iPadOS", "watchOS", "macOS"]
    let mentor = ["Hue", "Bran", "Jack"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cell의 높이가 하나로 고정일 때는 viewDidLoad()에서 설정해줘도 된다.
        tableView.rowHeight = 60
    }
    
    // 옵션: 섹션 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Apple" : "Mentor"
    }
    
    // 1. 셀의 갯수(필수)
    // ex. 카카오톡 100명
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return section == 0 ? list.count : 200
    }
    
    //    // 2. 셀의 높이(필수는 아니지만 권장)
    //    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        print(#function)
    //
    ////        return indexPath.section == 0 ? 44 : 60
    //        return 60
    //    }
    
    // 3. 셀의 디자인 및 데이터 처리
    // ex. 카카오톡 친구 이름, 프로필 사진, 상태 메세지 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print(#function, indexPath)
        
        let color: UIColor = [.systemBrown, .systemIndigo, .systemOrange, .systemGreen].randomElement()!
        
        // 3-1. 어떤 셀을 쓸 지 결정
        // dequeueReusableCell -> 재사용 매커니즘
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "timmyCell")!
            
            cell.imageView?.image = UIImage(systemName: "star.fill")
            
            cell.imageView?.tintColor = color
            cell.textLabel?.text = list[indexPath.row]
            cell.textLabel?.textColor = color
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            
            cell.backgroundColor = indexPath.row % 2 == 0 ? .systemBackground : .lightGray.withAlphaComponent(0.2)
            
            cell.detailTextLabel?.text = "iOS 앱개발자 과정"
            cell.detailTextLabel?.textColor = .lightGray
            cell.detailTextLabel?.font = .boldSystemFont(ofSize: 14)
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "anotherCell")!
        
        cell.imageView?.image = UIImage(systemName: "figure.child")
        
        cell.imageView?.tintColor = color
        cell.textLabel?.text = "멘토다"
        cell.textLabel?.textColor = color
        cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .systemBackground : .lightGray.withAlphaComponent(0.2)
        
        cell.detailTextLabel?.text = "멘토"
        cell.detailTextLabel?.textColor = .lightGray
        cell.detailTextLabel?.font = .boldSystemFont(ofSize: 14)
        
        return cell
    }
}
