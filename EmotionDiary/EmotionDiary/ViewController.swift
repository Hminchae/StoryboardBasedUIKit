//
//  ViewController.swift
//  EmotionDiary
//
//  Created by 황민채 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard // 싱글톤 객체

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var mainTitle: UILabel!
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var happyLabel: UILabel!
    var happyCount: Int = 0
    
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var loveLabel: UILabel!
    var loveCount: Int = 0
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    var likeCount: Int = 0
    
    @IBOutlet weak var freakOutButton: UIButton!
    @IBOutlet weak var freakOutLabel: UILabel!
    var freakOutCount: Int = 0
    
    @IBOutlet weak var upsetButton: UIButton!
    @IBOutlet weak var upsetLabel: UILabel!
    var upsetCount: Int = 0
    
    @IBOutlet weak var depressedButton: UIButton!
    @IBOutlet weak var depressedLabel: UILabel!
    var depressedCount: Int = 0
    
    @IBOutlet weak var boredButton: UIButton!
    @IBOutlet weak var boredLabel: UILabel!
    var boredCount: Int = 0
    
    @IBOutlet weak var annoyingButton: UIButton!
    @IBOutlet weak var annoyingLabel: UILabel!
    var annoyingCount: Int = 0
    
    @IBOutlet weak var cryingButton: UIButton!
    @IBOutlet weak var cryingLabel: UILabel!
    var cryingCount: Int = 0
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        menuButton.setTitle("", for: .normal)
        menuButton.tintColor = .black
        
        mainTitle.font = .systemFont(ofSize: 20, weight: .semibold)
        mainTitle.text = "감정 다이어리"
        mainTitle.textAlignment = .center
        
        happyButton.setTitle("", for: .normal)
        happyButton.setImage(UIImage(named: "slime1"), for: .normal)
        happyLabel.text = "행복해 \(defaults.integer(forKey: "MyHappy"))"
        happyLabel.textAlignment = .center
        happyLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        loveButton.setTitle("", for: .normal)
        loveButton.setImage(UIImage(named: "slime2"), for: .normal)
        loveLabel.text = "사랑해 \(defaults.integer(forKey: "MyLove"))"
        loveLabel.textAlignment = .center
        loveLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        likeButton.setTitle("", for: .normal)
        likeButton.setImage(UIImage(named: "slime3"), for: .normal)
        likeLabel.text = "좋아해 \(defaults.integer(forKey: "MyLike"))"
        likeLabel.textAlignment = .center
        likeLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        freakOutButton.setTitle("", for: .normal)
        freakOutButton.setImage(UIImage(named: "slime4"), for: .normal)
        freakOutLabel.text = "당황해 \(defaults.integer(forKey: "MyFreakOut"))"
        freakOutLabel.textAlignment = .center
        freakOutLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        upsetButton.setTitle("", for: .normal)
        upsetButton.setImage(UIImage(named: "slime5"), for: .normal)
        upsetLabel.text = "속상해 \(defaults.integer(forKey: "MyUpset"))"
        upsetLabel.textAlignment = .center
        upsetLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        depressedButton.setTitle("", for: .normal)
        depressedButton.setImage(UIImage(named: "slime6"), for: .normal)
        depressedLabel.text = "우울해 \(defaults.integer(forKey: "MyDepressed"))"
        depressedLabel.textAlignment = .center
        depressedLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        boredButton.setTitle("", for: .normal)
        boredButton.setImage(UIImage(named: "slime7"), for: .normal)
        boredLabel.text = "심심해 \(defaults.integer(forKey: "MyBored"))"
        boredLabel.textAlignment = .center
        boredLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        annoyingButton.setTitle("", for: .normal)
        annoyingButton.setImage(UIImage(named: "slime8"), for: .normal)
        annoyingLabel.text = "짜증나 \(defaults.integer(forKey: "MyAnnoying"))"
        annoyingLabel.textAlignment = .center
        annoyingLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        cryingButton.setTitle("", for: .normal)
        cryingButton.setImage(UIImage(named: "slime9"), for: .normal)
        cryingLabel.text = "눈물나 \(defaults.integer(forKey: "MyCrying"))"
        cryingLabel.textAlignment = .center
        cryingLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
    }
    
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            happyCount = defaults.integer(forKey: "MyHappy")
            happyCount += 1
            defaults.set(happyCount, forKey: "MyHappy")
            happyLabel.text = "행복해 \(happyCount)"
        case 2:
            loveCount = defaults.integer(forKey: "MyLove")
            loveCount += 1
            defaults.set(loveCount, forKey: "MyLove")
            loveLabel.text = "사랑해 \(loveCount)"
        case 3:
            likeCount = defaults.integer(forKey: "MyLike")
            likeCount += 1
            defaults.set(likeCount, forKey: "MyLike")
            likeLabel.text = "좋아해 \(likeCount)"
        case 4:
            freakOutCount = defaults.integer(forKey: "MyFreakOut")
            freakOutCount += 1
            defaults.set(freakOutCount, forKey: "MyFreakOut")
            freakOutLabel.text = "당황해 \(freakOutCount)"
        case 5:
            upsetCount = defaults.integer(forKey: "MyUpset")
            upsetCount += 1
            defaults.set(upsetCount, forKey: "MyUpset")
            upsetLabel.text = "속상해 \(upsetCount)"
        case 6:
            depressedCount = defaults.integer(forKey: "MyDepressed")
            depressedCount += 1
            defaults.set(depressedCount, forKey: "MyDepressed")
            depressedLabel.text = "우울해 \(depressedCount)"
        case 7:
            boredCount = defaults.integer(forKey: "MyBored")
            boredCount += 1
            defaults.set(boredCount, forKey: "MyBored")
            boredLabel.text = "심심해 \(boredCount)"
        case 8:
            annoyingCount = defaults.integer(forKey: "MyAnnoying")
            annoyingCount += 1
            defaults.set(annoyingCount, forKey: "MyAnnoying")
            annoyingLabel.text = "짜증나 \(annoyingCount)"
        case 9:
            cryingCount = defaults.integer(forKey: "MyCrying")
            cryingCount += 1
            defaults.set(cryingCount, forKey: "MyCrying")
            cryingLabel.text = "눈물나 \(cryingCount)"
        default:
            print("오류발생")
        }
    }
}

