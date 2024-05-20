//
//  SavedContentsViewController.swift
//  Netflix
//
//  Created by 황민채 on 5/16/24.
//

import UIKit

class SavedContentsViewController: UIViewController {
    @IBOutlet weak var savedContentsTitleLabel: UILabel!
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var settingButton: UIButton!
    
    @IBOutlet weak var lookAroundButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedContentsTitleLabel.text = "저장한 콘텐츠 목록"
        savedContentsTitleLabel.font = .systemFont(ofSize: 24, weight: .heavy)
        
        mainLabel.text = "'나만의 자동 저장' 기능"
        mainLabel.textAlignment = .center
        mainLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        subLabel.text = "취향에 맞는 영화와 시리즈를 자동으로 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요."
        subLabel.textAlignment = .center
        subLabel.numberOfLines = 3
        subLabel.font = .systemFont(ofSize: 16, weight: .regular)
        subLabel.textColor = .darkGray
        
        posterImage.image = UIImage(named: "dummy")
        
        settingButton.backgroundColor = .blue
        settingButton.setTitle("설정하기", for: .normal)
        settingButton.setTitleColor(.white, for: .normal)
        settingButton.cornerRadius = 5
        
        lookAroundButton.backgroundColor = .white
        lookAroundButton.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        lookAroundButton.setTitleColor(.black, for: .normal)
        lookAroundButton.cornerRadius = 5
    }
}
