//
//  ReusableProtocol.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/3/24.
//

import UIKit

// AnyObject: 클래스 제약
protocol ReusableProtocol: AnyObject {
    static var identifier: String { get }
}

extension UITableViewCell : ReusableProtocol {
    static var identifier: String {
        return String(describing: self) // 리턴이 있어도 없어도 괜찮음
    }
}

extension UIViewController: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
 
