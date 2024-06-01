//
//  OthersChatTableViewCell.swift
//  TravelMagazine
//
//  Created by 황민채 on 6/1/24.
//

import UIKit

class OthersChatTableViewCell: UITableViewCell {
    @IBOutlet weak var chatUserProfileImage: UIImageView!
    
    @IBOutlet weak var chatUserNameLabel: UILabel!
    @IBOutlet weak var chatContentLabel: UILabel!
    @IBOutlet weak var chatTimeLabel: UILabel!
    @IBOutlet weak var chatBubbleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension OthersChatTableViewCell {
    func configureData(_ data: Chat) {
        chatTimeLabel.text = "\(data.date.suffix(5))"
        chatContentLabel.text = data.message
        chatUserNameLabel.text = data.user.rawValue
        chatUserProfileImage.image = UIImage(named: data.user.rawValue)
    }
    
    func configureLayout() {
        
        chatBubbleView.layer.borderWidth = 1
        chatBubbleView.layer.cornerRadius = 8
        chatBubbleView.layer.borderColor = UIColor.lightGray.cgColor
        
        chatContentLabel.numberOfLines = 0
    }
}
