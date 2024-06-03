//
//  HomeVideoTableViewCell.swift
//  KStreaming
//
//  Created by 황민채 on 6/2/24.
//

import UIKit

class HomeVideoTableViewCell: UITableViewCell {
    
    static let identifier: String = "HomeVideoTableViewCell"
    static let height: CGFloat = 321
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var hotImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var channelImageView: UIImageView!
    @IBOutlet weak var channeltitleLabel: UILabel!
    @IBOutlet weak var channelSubtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        self.containerView.layer.borderWidth = 1
        self.containerView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
