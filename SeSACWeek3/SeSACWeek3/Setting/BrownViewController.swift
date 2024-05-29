//
//  BrownViewController.swift
//  SeSACWeek3
//
//  Created by 황민채 on 5/29/24.
//

import UIKit

class BrownViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "네비게이션 타이틀"
    }
    // present - dismiss
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // push - pop
    @IBAction func popButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
