//
//  FoodTableViewCell.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/27/24.
//

import UIKit
import Kingfisher

class FoodTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout() // -> 호출 수 를 줄이게 함, 변경이 되지 않는 디자인들을 여기에 넣어 최적화 함
    }
    // 디자인
    func configureLayout() {
        print(#function)
//        titleLabel.font = .boldSystemFont(ofSize: 17)
//        subTitleLabel.font = .systemFont(ofSize: 13)
//        subTitleLabel.textColor = .darkGray
//        descriptionLabel.font = .boldSystemFont(ofSize: 20)
//        descriptionLabel.textColor = .darkText
//        mainImageView.backgroundColor = .lightGray
        titleLabel.setPrimaryLabel()
        subTitleLabel.setPrimaryLabel()
        descriptionLabel.setPrimaryLabel() // UILabel Extension 으로 코드 줄이기
    }
    
    // 데이터
    func configureCell(data: Restaurant) {
        print(#function)
        titleLabel.text = "\(data.name) | \(data.category)"
        subTitleLabel.text = data.address
        descriptionLabel.text = data.price.formatted() + "원"
        let url = URL(string: data.image)
        mainImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
        mainImageView.contentMode = .scaleAspectFill
    }
}
