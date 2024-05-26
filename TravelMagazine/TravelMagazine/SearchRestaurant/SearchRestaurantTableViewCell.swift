//
//  SearchRestaurantTableViewCell.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/26/24.
//

import UIKit

class SearchRestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var storeImage: UIImageView!
    
    @IBOutlet weak var storeTitle: UILabel!
    @IBOutlet weak var storeCategory: UILabel!
    @IBOutlet weak var storeStarButton: UIButton!
    
    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var addressButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
