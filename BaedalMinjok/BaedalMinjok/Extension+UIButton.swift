//
//  Extension+UIButton.swift
//  BaedalMinjok
//
//  Created by 황민채 on 5/15/24.
//

import UIKit

extension UIButton {
    private struct AssociatedKeys {
        static var subtitleLabel = "subtitleLabel"
    }
    
    var subtitleLabel: UILabel? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.subtitleLabel) as? UILabel
        }
        set(label) {
            objc_setAssociatedObject(self, &AssociatedKeys.subtitleLabel, label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if let label = label {
                self.addSubview(label)
            }
        }
    }
    
    func addSubtitle(_ subtitle: String) {
        if subtitleLabel == nil {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 14, weight: .black) // 자막 폰트 크기 설정
            self.subtitleLabel = label
        }
        subtitleLabel?.text = subtitle
        
        if let label = subtitleLabel {
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            label.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        }
    }
}
