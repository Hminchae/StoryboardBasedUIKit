//
//  customButton.swift
//  BaedalMinjok
//
//  Created by 황민채 on 5/15/24.
//

import UIKit

class CustomButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.addSubtitle("배민라이더스")
    }
}
