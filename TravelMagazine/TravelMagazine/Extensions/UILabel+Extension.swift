//
//  UILabel+Extension.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

extension UILabel {
    //-------------Home----------------
    func setHomePhotoTitleLabel() {
        self.textColor = .label
        self.numberOfLines = 0
        self.font = UIFont.pretendard(size: 24, weight: .semibold)
    }
    
    func setHomeSubtitleLabel() {
        self.textColor = .gray
        self.font = UIFont.pretendard(size: 15, weight: .bold)
    }
    
    func setDateLabel() {
        self.textColor = .gray
        self.font =  UIFont.pretendard(size: 13, weight: .medium)
        self.textAlignment = .right
    }
    //------------Search---------------
    
    //-------------City----------------
    func setPrimaryLabel() {
        self.font = UIFont.pretendard(size: 17, weight: .semibold)
        self.textAlignment = .left
        self.textColor = .label
    }
    
    func setSecndaryLabel() {
        self.font = UIFont.pretendard(size: 15, weight: .medium)
        self.textAlignment = .left
        self.textColor = .lightGray
        self.numberOfLines = 3
    }
    
    func setSmallLabel() {
        self.font = UIFont.pretendard(size: 13, weight: .medium)
        self.textAlignment = .left
        self.textColor = .lightGray
    }
    
    func setAdLabel() {
        self.textAlignment = .center
        self.textColor = .black
        self.font = UIFont.pretendard(size: 13, weight: .bold)
    }
    
    func setAdTitleLabel() {
        self.text = "AD"
        self.textAlignment = .center
        self.textColor = .black
        self.numberOfLines = 0
        self.font = UIFont.pretendard(size: 17, weight: .heavy)
    }
}
