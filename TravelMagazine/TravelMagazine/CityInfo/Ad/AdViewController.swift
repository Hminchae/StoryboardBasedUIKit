//
//  AdViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/30/24.
//

import UIKit

class AdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "광고 화면"
        configureNavigationItem()
    }
    
}

// MARK: AdView UI 설정 관련
extension AdViewController {
    func configureNavigationItem() {
        let dismissButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(xButtonClicked))
        dismissButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = dismissButton
    }
    
    @objc func xButtonClicked() {
        dismiss(animated: true)
    }
}
