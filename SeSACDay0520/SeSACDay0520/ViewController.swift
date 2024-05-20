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
    var twoCount = 0
    var threeCount = 0
    
    var count = [0, 0, 0]
    
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
        // 1. 어떤 버튼을 클릭했는지 어떻게 알까요?
        // -> currentTitle (옵셔널 조심, 버전 조심)
        // -> tag
        print(sender.tag)
        count[sender.tag] += 1
        oneLabel.text = "\(count[0])클릭!"
        twoLabel.text = "\(count[1])클릭!"
        threeLabel.text = "\(count[2])클릭!"
    }
}

