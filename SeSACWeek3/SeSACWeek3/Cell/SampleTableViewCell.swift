//
//  SampleTableViewCell.swift
//  SeSACWeek3
//
//  Created by 황민채 on 5/28/24.
//

import UIKit
import Kingfisher

class SampleTableViewCell: UITableViewCell {
    static let identifier = "SampleTableViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var reviewImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureLayout() {
        contentLabel.font = .boldSystemFont(ofSize: 15)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .brown
        
        profileImageView.backgroundColor = .gray
        
        profileImageView.contentMode = .scaleAspectFill
        
        reviewImageView.backgroundColor = .gray

        reviewImageView.contentMode = .scaleAspectFill
        
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .white
        reviewImageView.image = nil
    }

    func configureCell(_ data: Travel) {
        contentLabel.text = data.titleDescription
        
        if let url = data.travel_image {
            let urlStr = URL(string: url)
            profileImageView.kf.setImage(with: urlStr)
            reviewImageView.kf.setImage(with: urlStr)
        }
        
        if data.ad {
            backgroundColor = .yellow
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        reviewImageView.layer.cornerRadius = reviewImageView.frame.width / 2
    }
}
