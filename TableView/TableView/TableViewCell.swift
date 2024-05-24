//
//  TableViewCell.swift
//  TableView
//
//  Created by 황민채 on 5/24/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var todoListLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var todolistCellView : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
