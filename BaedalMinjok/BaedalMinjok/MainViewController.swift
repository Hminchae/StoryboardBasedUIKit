//
//  MainViewController.swift
//  BaedalMinjok
//
//  Created by 황민채 on 5/15/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var bMart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        bMart.layer.opacity = 0.5
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { // 실행 지연 : 1초 후 실행시키기
            self.bMart.layer.opacity = 1
        }
    }
}
