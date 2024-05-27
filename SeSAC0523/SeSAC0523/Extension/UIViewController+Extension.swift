//
//  UIViewController+Extension.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

extension UIViewController {
    
    func setBackground() {
        view.backgroundColor = .lightGray
    }
    
    func showAlert(title: String) {
        // 1.
        let alert = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .alert)
        
        // 2.
        let ok = UIAlertAction(
            title: "확인",
            style: .default)

        // 3.
        alert.addAction(ok)
        
        // 4.
        present(alert, animated: true)
    }
}
