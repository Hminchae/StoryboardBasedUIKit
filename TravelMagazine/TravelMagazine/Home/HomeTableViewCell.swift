//
//  HomeTableViewCell.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/26/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var homePhotoCardImage: UIImageView!
    @IBOutlet weak var homePhotoTitleLabel: UILabel!
    @IBOutlet weak var homePhotoSubtitleLabel: UILabel!
    @IBOutlet weak var homePhotoDate: UILabel!
    @IBOutlet weak var homeTableCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
