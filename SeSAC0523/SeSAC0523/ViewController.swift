//
//  ViewController.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/23/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var hateLabel: UILabel!
    
    @IBOutlet weak var hateButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    var hateCount: Int = UserDefaults.standard.integer(forKey: "bigButton")
    
    //----------------생명주기 확인----------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Main \(#function)")
        
        let hate = UserDefaults.standard.integer(forKey: "bigButton")
        
        hateLabel.text = "싫어요 \(hate)"
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Main \(#function)")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Main \(#function)")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Main \(#function)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Main \(#function)")
        likeButton.backgroundColor = .yellow
        hateButton.backgroundColor = .orange
        guard let like = UserDefaults.standard.string(forKey: "like") else {
            likeLabel.text = "버튼 눌러줘"
            return
        }
        likeLabel.text = "좋아요 \(like)"
        likeLabel.textAlignment = .center
        
        let hate = UserDefaults.standard.integer(forKey: "bigButton")
        
        hateLabel.text = "싫어요 \(hate)"
    }
    //--------------------------------------------
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        //1. UserDefaults 에 저장된 데이터 가져오기
        let before = UserDefaults.standard.integer(forKey: "like")
        //2. 가져온 값에 1을 더하기
        let after = before + 1
        //3. UserDefaults에 2번값을 다시 저장하기
        UserDefaults.standard.set(after, forKey: "like")
        //4. UserDefaults에서 다시 데이터 가져오기
        let final = UserDefaults.standard.integer(forKey: "like")
        //5. 레이블에 표시하기
        likeLabel.text = "좋아요 \(final)"
    }
    
    
    @IBAction func hateButtonClicked(_ sender: UIButton) {
        let jack = "안녕하세요"
        let den = ""
    }
}

