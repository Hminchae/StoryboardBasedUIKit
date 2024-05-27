//
//  UILabel+Extension.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

extension UILabel {
    func setPrimaryLabel() {
        self.font = UIFont(name: "Pretendard-SemiBold", size: 17)
        self.textAlignment = .left
        self.textColor = .label
    }
    
    func setSecndaryLabel() {
        self.font = UIFont(name: "Pretendard-Bold", size: 15)
        self.textAlignment = .left
        self.textColor = .lightGray
        self.numberOfLines = 2
    }
    
    func setSmallLabel() {
        self.font = UIFont(name: "Pretendard-Medium", size: 13)
        self.textAlignment = .left
        self.textColor = .lightGray
    }
    
    func setAdLabel() {
        self.textAlignment = .center
        self.textColor = .black
        self.font = UIFont(name: "Pretendard-Bold", size: 13)
    }
    
    func setAdTitleLabel() {
        self.text = "AD"
        self.textAlignment = .center
        self.textColor = .black
        self.numberOfLines = 2
        self.font = UIFont(name: "Pretendard-ExtraBold", size: 17)
    }
}
