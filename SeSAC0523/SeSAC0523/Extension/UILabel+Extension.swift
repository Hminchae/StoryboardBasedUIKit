//
//  UILabel+Extension.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

extension UILabel {
    func setPrimaryLabel() {
        self.font = .boldSystemFont(ofSize: 17)
        self.textAlignment = .left
        self.backgroundColor = .lightGray
        self.textColor = .darkGray
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
    }
}
