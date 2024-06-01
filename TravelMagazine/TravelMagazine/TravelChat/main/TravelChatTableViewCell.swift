//
//  TravelChatTableViewCell.swift
//  TravelMagazine
//
//  Created by 황민채 on 6/1/24.
//

import UIKit
import Kingfisher

class TravelChatTableViewCell: UITableViewCell {
    @IBOutlet weak var chatRoomMainImage: UIImageView!
    @IBOutlet weak var chatRoomNameLabel: UILabel!
    @IBOutlet weak var chatRoomRecentTimeLabel: UILabel!
    @IBOutlet weak var chatRoomRecentContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureCellLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCellLayout() {
        chatRoomNameLabel.font = UIFont(name: "Pretendard-SemiBold", size: 17)
        chatRoomRecentContentLabel.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        chatRoomRecentContentLabel.textColor = .gray
        chatRoomRecentTimeLabel.font = UIFont(name: "Pretendard-SemiBold", size: 13)
        chatRoomRecentTimeLabel.textColor = .lightGray
    }
    
    func configureCellData(_ data: ChatRoom) {
        
        chatRoomMainImage.image = UIImage(named: data.chatroomImage[0])
        
        chatRoomNameLabel.text = data.chatroomName
        
        let chatData = data.chatList[0]
        chatRoomRecentTimeLabel.text = "\(chatData.date[2]!)\(chatData.date[3]!).\(chatData.date.suffix(5))"
        
        chatRoomRecentContentLabel.text = chatData.message
    }
    
}

