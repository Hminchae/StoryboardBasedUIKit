//
//  TravelChatViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 6/1/24.
//

import UIKit

class TravelChatViewController: UIViewController {

    // 서치바
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchBarView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "TRAVEL CHAT"
        configureLayout()
    }
}

extension TravelChatViewController {
    func configureLayout() {
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.setTitle("", for: .normal)
        searchButton.tintColor = .darkGray
        searchBarView.backgroundColor = #colorLiteral(red: 0.9058822393, green: 0.9058824182, blue: 0.9101879001, alpha: 1)
        searchBarView.layer.cornerRadius = 7
        
        searchTextField.backgroundColor = .clear
        searchTextField.borderStyle = .none
        searchTextField.textColor = .darkGray
        searchTextField.placeholder = "친구 이름을 검색해보세요"
    }
}
