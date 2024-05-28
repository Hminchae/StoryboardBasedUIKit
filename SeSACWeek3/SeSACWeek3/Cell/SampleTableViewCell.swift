//
//  SampleTableViewCell.swift
//  SeSACWeek3
//
//  Created by 황민채 on 5/28/24.
//

import UIKit

class SampleTableViewCell: UITableViewCell {
    static let identifier = "SampleTableViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var reviewImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
