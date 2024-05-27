//
//  HateViewController.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/23/24.
//

import UIKit

class HateViewController: UIViewController {

    @IBOutlet weak var bigButton: UIButton!
    var innerCount: Int = UserDefaults.standard.integer(forKey: "bigButton")
    
    //----------------생명주기 확인----------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Hate \(#function)")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Hate \(#function)")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Hate \(#function)")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Hate \(#function)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hate \(#function)")
        bigButton.setTitle("나를 싫어요 버튼으로 쓰세요.", for: .normal)
    }
    //------------------------------------------------
    
    @IBAction func bigButtonClicked(_ sender: Any) {
        // 1. UserDefault 가져오기
        var origin = UserDefaults.standard.integer(forKey: "bigButton")
        // 2. 1 더해주기
        let update = origin + 1
        // 3. 수정된 값 UserDefaults에 저장하기
        UserDefaults.standard.set(update, forKey: "bigButton")
        print(origin)
    }
}
