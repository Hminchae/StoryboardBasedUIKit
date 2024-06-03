//
//  UIFonts+Extension.swift
//  TravelMagazine
//
//  Created by 황민채 on 6/3/24.
//

import UIKit

extension UIFont {
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        
        let familyName = "Pretendard"
        var weightString: String
        
        switch weight {
        case .black:
            weightString = "Black"
        case .bold:
            weightString = "Blod"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Regular"
        }

        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: weight)
    }
}


// 사용 예)
// label.font = UIFont.pretendard(size: 18, weight: .medium)
