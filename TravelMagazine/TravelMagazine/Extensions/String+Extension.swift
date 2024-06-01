//
//  String+Extension.swift
//  TravelMagazine
//
//  Created by 황민채 on 6/1/24.
//

import Foundation

extension String {
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else {
            return nil
        }
        let target = index(startIndex, offsetBy: idx)
        return String(self[target])
    }
}
