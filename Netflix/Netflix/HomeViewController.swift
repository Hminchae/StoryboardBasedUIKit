//
//  HomeViewController.swift
//  Netflix
//
//  Created by 황민채 on 5/16/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTitleLabel: UILabel!
    @IBOutlet weak var homeMainPoster: UIImageView!
    
    @IBOutlet weak var homeLeftButton: UIButton!
    @IBOutlet weak var homeRightButton: UIButton!
    
    @IBOutlet weak var homeNowContentsLabel: UILabel!
    
    @IBOutlet weak var homeNowFirstContentsPoster: UIImageView!
    @IBOutlet weak var homeNowSecondContentsPoster: UIImageView!
    @IBOutlet weak var homeNowThirdContentsPoster: UIImageView!
    
    @IBOutlet weak var firstPosterTop10: UIImageView!
    @IBOutlet weak var secondPosterTop10: UIImageView!
    @IBOutlet weak var thirdPosterTop10: UIImageView!
    
    var imageSet: [String] = ["노량", "더퍼스트슬램덩크", "밀수", "범죄도시3", "서울의봄", "스즈메의문단속", "아바타물의길", "오펜하이머", "육사오", "콘크리트유토피아"]
    
    var firstPosterTop10Visable = Bool.random()
    var secondPosterTop10Visable = Bool.random()
    var thirdPosterTop10Visable = Bool.random()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
        
        homeTitleLabel.text = "황민채님"
        homeTitleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        
        homeMainPoster.contentMode = .scaleAspectFill
        homeMainPoster.cornerRadius = 10
        
        homeNowContentsLabel.text = "지금 뜨는 콘텐츠"
        homeNowContentsLabel.font = .systemFont(ofSize: 18, weight: .regular)
        
        homeLeftButton.setImage(UIImage(named: "play"), for: .normal)
        homeLeftButton.backgroundColor = .white
        homeLeftButton.tintColor = .black
        homeLeftButton.cornerRadius = 5
        homeLeftButton.setTitle("재생", for: .normal)
        homeLeftButton.layer.shadowOpacity = 20
        
        homeRightButton.setImage(UIImage(systemName: "plus"), for: .normal)
        homeRightButton.backgroundColor = .darkGray
        homeRightButton.tintColor = .white
        homeRightButton.cornerRadius = 5
        homeRightButton.setTitle("내가 찜한 리스트", for: .normal)
        homeRightButton.subtitleLabel?.adjustsFontSizeToFitWidth = true
        homeRightButton.titleLabel?.adjustsFontForContentSizeCategory = true
        homeRightButton.layer.shadowOpacity = 20
        
        homeNowFirstContentsPoster.cornerRadius = 5
        homeNowSecondContentsPoster.cornerRadius = 5
        homeNowThirdContentsPoster.cornerRadius = 5
        
        firstPosterTop10.image = firstPosterTop10Visable ? UIImage(named: "top10 badge") : nil
        secondPosterTop10.image = secondPosterTop10Visable ? UIImage(named: "top10 badge") : nil
        thirdPosterTop10.image = thirdPosterTop10Visable ? UIImage(named: "top10 badge") : nil
    }

    fileprivate func extractedFunc() {
        self.imageSet.shuffle()
        let mainImage: String = imageSet[0]
        let bottomFirstImage: String = imageSet[1]
        let bottomSecondImage: String = imageSet[2]
        let bottomThirdImage: String = imageSet[3]
        homeMainPoster.image = UIImage(named: mainImage)
        homeNowFirstContentsPoster.image = UIImage(named: bottomFirstImage)
        homeNowSecondContentsPoster.image = UIImage(named: bottomSecondImage)
        homeNowThirdContentsPoster.image = UIImage(named: bottomThirdImage)
    }
    
    @IBAction func leftButtonClicked(_ sender: Any) {
        extractedFunc()
        
    }
    
    @IBAction func rightButtonClicked(_ sender: UIButton) {
        firstPosterTop10Visable = Bool.random()
        secondPosterTop10Visable = Bool.random()
        thirdPosterTop10Visable = Bool.random()
        
        firstPosterTop10.image = firstPosterTop10Visable ? UIImage(named: "top10 badge") : nil
        secondPosterTop10.image = secondPosterTop10Visable ? UIImage(named: "top10 badge") : nil
        thirdPosterTop10.image = thirdPosterTop10Visable ? UIImage(named: "top10 badge") : nil
    }
}
