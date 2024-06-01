//
//  AdTableViewCell.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    //static let identifier = "AdTableViewCell"
    
    @IBOutlet weak var adTitleLabel: UILabel!
    @IBOutlet weak var adBadgeLabel: UILabel!
    @IBOutlet weak var adView: UIView!
    @IBOutlet weak var adBadgeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 8, bottom: 20, right: 8))
    }
    
    func configureLayout() {
        adTitleLabel.setAdTitleLabel()
        adBadgeLabel.setAdLabel()
        adBadgeView.setBadgeView()
        adView.setAdView()
    }
    
    func configureCell(data: Travel) {
        adTitleLabel.text = data.title
    }
}
