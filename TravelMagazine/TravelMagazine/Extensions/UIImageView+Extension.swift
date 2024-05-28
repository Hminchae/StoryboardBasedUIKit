//
//  UIImageView+Extension.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

extension UIImageView {
    //-------------Home----------------
    func setHomePhotoCardImage() {
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.gray.cgColor
    }
    //------------Search---------------
    //-------------City----------------
    func setImageView() {
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 10
    }
}
