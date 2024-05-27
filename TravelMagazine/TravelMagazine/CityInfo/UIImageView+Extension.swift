//
//  UIImageView+Extension.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

extension UIImageView {
    func setImageView() {
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 10
    }
}
