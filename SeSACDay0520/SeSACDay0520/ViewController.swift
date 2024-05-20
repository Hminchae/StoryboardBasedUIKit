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
    
    @IBOutlet var labelList: [UILabel]! // 연결하는 순서대로 인덱스 부여
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
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .heavy)
    }
    @IBAction func oneButtonClicked(_ sender: UIButton) {
        // 1. 어떤 버튼을 클릭했는지 어떻게 알까요?
        // -> currentTitle (옵셔널 조심, 버전 조심)
        // -> tag
        // 2. @IBOutlet 어떻게 못할까? -> 아울렛 컬렉션!
        count[sender.tag] += 1
        labelList[sender.tag].text = "\(count[sender.tag])번 클릭!"
    }
}

