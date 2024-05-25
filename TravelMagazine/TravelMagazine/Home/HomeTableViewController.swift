//
//  HomeTableViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/26/24.
//

import UIKit
import Kingfisher

class HomeTableViewController: UITableViewController {
    @IBOutlet weak var homeNavgationTitle: UINavigationBar!
    
    var magazineInfo : [Magazine] = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none // 테이블뷰 separator 없애기
        homeNavgationTitle.barTintColor = .systemBackground
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return magazineInfo.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(#function)
        return 490
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homePhotoCard", for: indexPath) as! HomeTableViewCell
        
        // 사진
        let url = URL(string: magazineInfo[indexPath.row].photo_image)
        cell.homePhotoCardImage.kf.setImage(with: url)
        cell.homePhotoCardImage.contentMode = .scaleAspectFill
        cell.homePhotoCardImage.layer.cornerRadius = 10
        cell.homePhotoCardImage.layer.shadowColor = UIColor.gray.cgColor

        // 타이틀
        cell.homePhotoTitleLabel.text = magazineInfo[indexPath.row].title
        cell.homePhotoTitleLabel.textColor = .label
        cell.homePhotoTitleLabel.numberOfLines = 2
        cell.homePhotoTitleLabel.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        
        
        // 서브 타이틀
        cell.homePhotoSubtitleLabel.text = magazineInfo[indexPath.row].subtitle
        cell.homePhotoSubtitleLabel.textColor = .gray
        cell.homePhotoSubtitleLabel.font = UIFont(name: "Pretendard-Bold", size: 15)
        
        // 날짜
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let convertDate = dateFormatter.date(from: magazineInfo[indexPath.row].date) // Date 타입으로 변환
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yy년 M월 dd일"
        
        let resultDate = myDateFormatter.string(from: convertDate!)
        cell.homePhotoDate.text = resultDate
        cell.homePhotoDate.textColor = .gray
        cell.homePhotoDate.font = UIFont(name: "Pretendard-Medium", size: 13)
        cell.homePhotoDate.textAlignment = .right
        
        return cell
    }
    
    
    

}
