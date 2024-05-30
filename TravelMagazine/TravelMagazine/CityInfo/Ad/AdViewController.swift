//
//  AdViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/30/24.
//

import UIKit
import SafariServices

class AdViewController: UIViewController {

    @IBOutlet weak var adButton: UIButton!
    @IBOutlet weak var adImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "광고"
        configureNavigationItem()
        configurationLayout()
    }
    @IBAction func adButtonClicked(_ sender: UIButton) {
        let sesacWeb = NSURL(string: "https://sesac.seoul.kr/common/greeting.do")
        let sesacSafariView: SFSafariViewController = SFSafariViewController(url: sesacWeb! as URL)
        self.present(sesacSafariView, animated: true, completion: nil)
    }
    
}

// MARK: AdView UI 설정 관련
extension AdViewController {
    func configureNavigationItem() {
        let dismissButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(xButtonClicked))
        dismissButton.tintColor = .label
        
        navigationItem.leftBarButtonItem = dismissButton
    }
    
    @objc func xButtonClicked() {
        dismiss(animated: true)
    }
    
    func configurationLayout() {
        adImageView.image = UIImage(named: "SeSACAd")
        
        adButton.setTitle("지금 참여하러 가기", for: .normal)
        adButton.setTitleColor(.label, for: .normal)
        adButton.backgroundColor = .systemBlue
        adButton.layer.cornerRadius = 15
    }
}
