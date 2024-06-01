//
//  CityInfoTableViewCell.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/27/24.
//

import UIKit
import Cosmos
import Kingfisher

class CityInfoTableViewCell: UITableViewCell {
    //static let identifier = "CityInfoTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var saveCountLabel: UILabel!
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        titleLabel.setPrimaryLabel()
        subTitleLabel.setSecndaryLabel()
        saveCountLabel.setSmallLabel()
        mainImageView.setImageView()
        likeButton.setHeartButton()
    }
    
    func configureCell(data: Travel) {
        titleLabel.text = data.title
        subTitleLabel.text = data.description
        
        rateView.settings.updateOnTouch = false // 별점 터치 막기
        
        // 별점 이미지
        if let grade = data.grade {
            rateView.rating = grade
            rateView.text = "(\(grade))"
        } else {
            rateView.rating = 0
            rateView.text = "(0.0)"
        }
    
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        // 저장 숫자
        if let saveCount = data.save {
            let result = numberFormatter.string(from: NSNumber(value: saveCount))
            saveCountLabel.text = "﹒저장 \(result!)"
        } else {
            saveCountLabel.text = "﹒저장 정보 없음"
        }
        
        // 여행 사진
        if let url = data.travel_image {
            let urlStr = URL(string: url)
            mainImageView.kf.setImage(with: urlStr)
        } else {
            mainImageView.image = UIImage(named: "waitingImage")
        }
        
        var heartState: Bool = data.like ?? false
        var heartImage: UIImage
        
        heartImage = heartState ? UIImage(systemName: "heart.fill")! : UIImage(systemName: "heart")!
        
        likeButton.setImage(heartImage, for: .normal)
        likeButton.setTitle("", for: .normal)
    }
}
