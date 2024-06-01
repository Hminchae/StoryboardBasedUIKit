//
//  MyChatTableViewCell.swift
//  TravelMagazine
//
//  Created by 황민채 on 6/1/24.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {

    @IBOutlet weak var myChatBubbleView: UIView!
    @IBOutlet weak var myChatTimeLabel: UILabel!
    @IBOutlet weak var myChatContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension MyChatTableViewCell {
    func configureData(_ data: Chat) {
        myChatTimeLabel.text = "\(data.date.suffix(5))"
        myChatContentLabel.text = data.message
    }
    
    func configureLayout() {
        myChatBubbleView.layer.borderWidth = 1
        myChatBubbleView.layer.cornerRadius = 8
        myChatBubbleView.layer.borderColor = UIColor.gray.cgColor
        myChatBubbleView.backgroundColor = #colorLiteral(red: 0.874509871, green: 0.874509871, blue: 0.874509871, alpha: 1)
        
        myChatContentLabel.textAlignment = .right
        myChatTimeLabel.textAlignment = .right
        myChatContentLabel.numberOfLines = 0
        
    }
}
