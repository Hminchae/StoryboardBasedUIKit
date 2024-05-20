//
//  ViewController.swift
//  SeSACDay0520
//
//  Created by 황민채 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    
    var oneCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designLabelUI(oneLabel, thisIsColorForLabelText: .darkGray)
        designLabelUI(twoLabel, thisIsColorForLabelText: .red)
        designLabelUI(threeLabel, thisIsColorForLabelText: .purple)
        designButtonUI(buttonName: oneButton, titleColor: .red, titleText: "황")
        designButtonUI(buttonName: twoButton, titleColor: .green, titleText: "민")
        designButtonUI(buttonName: threeButton, titleColor: .systemPink, titleText: "채")
    }
    
    func designLabelUI(_ labelName: UILabel,
                       thisIsColorForLabelText textColor: UIColor
    ) {
        labelName.text = "0"
        labelName.textColor = textColor
        labelName.font = .boldSystemFont(ofSize: 30)
        labelName.textAlignment = .center
    }
    
    func designButtonUI(buttonName button: UIButton,
                        titleColor minchae: UIColor,
                        titleText name: String
    ) {
        button.setTitleColor(minchae, for: .normal)
        button.setTitle(name, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30, weight: .heavy)
    }
    @IBAction func oneButtonClicked(_ sender: UIButton) {
        oneLabel.text = "\(oneCount)"
    }
}

