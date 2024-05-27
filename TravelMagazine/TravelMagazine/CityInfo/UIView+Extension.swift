//
//  UIView+Extension.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

extension UIView {
    func setBadgeView() {
        self.layer.cornerRadius = 8
        self.backgroundColor = .white
    }
    
    func setAdView() {
        self.layer.cornerRadius = 10
        self.backgroundColor = RandomColor()
    }
    
    func RandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
}
