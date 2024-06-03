//
//  UserViewController.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/3/24.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet var userLabel: UILabel!
    
    var data: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = data else { return }
        userLabel.text = "\(data.name), \(data.userAge)"
        view.backgroundColor = data.bgColor
    }
}
