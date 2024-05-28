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
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return magazineInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homePhotoCard", for: indexPath) as! HomeTableViewCell
        
        // 사진
        let url = URL(string: magazineInfo[indexPath.row].photo_image)
        cell.homePhotoCardImage.kf.setImage(with: url)
        cell.homePhotoCardImage.setHomePhotoCardImage()

        // 타이틀
        cell.homePhotoTitleLabel.text = magazineInfo[indexPath.row].title
        cell.homePhotoTitleLabel.setHomePhotoTitleLabel()
        
        
        // 서브 타이틀
        cell.homePhotoSubtitleLabel.text = magazineInfo[indexPath.row].subtitle
        cell.homePhotoSubtitleLabel.setHomeSubtitleLabel()
        
        // 날짜
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyMMdd"
        
        let convertDate = dateFormatter.date(from: magazineInfo[indexPath.row].date) // Date 타입으로 변환
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yy년 M월 dd일"
        
        let resultDate = myDateFormatter.string(from: convertDate!)
        cell.homePhotoDate.text = resultDate
        cell.homePhotoDate.setDateLabel()
        
        return cell
    }
}
