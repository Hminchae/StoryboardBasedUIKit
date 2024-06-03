//
//  BasicTableViewCell.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/3/24.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        textLabel?.font = .boldSystemFont(ofSize: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
