//
//  Protocols.swift
//  TravelMagazine
//
//  Created by 황민채 on 6/1/24.
//

import UIKit

protocol ReuseIdentifierProtocol: AnyObject {
    static var identifier: String { get }
}

extension UITableViewController : ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell : ReuseIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
