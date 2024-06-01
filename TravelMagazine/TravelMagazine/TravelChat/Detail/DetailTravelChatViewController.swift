//
//  DetailTravelChatViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 6/1/24.
//

import UIKit

class DetailTravelChatViewController: UIViewController {
    
    var chatList: [Chat]?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var chatTextView: UIView!
    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var chatSendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        configureTableView()
        configureLayout()
    }
}
extension DetailTravelChatViewController {
    func configureLayout() {
        chatTextView.backgroundColor = #colorLiteral(red: 0.9686273932, green: 0.9686273932, blue: 0.9686273932, alpha: 1)
        chatTextView.layer.cornerRadius = 5
        
        chatTextField.placeholder = "메세지를 입력하세요"
        chatTextField.borderStyle = .none
        
        chatSendButton.setTitle("", for: .normal)
        chatSendButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        chatSendButton.tintColor = .systemGray

    }
}
extension DetailTravelChatViewController {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let myXib = UINib(nibName: MyChatTableViewCell.identifier, bundle: nil)
        let othersXib = UINib(nibName: OthersChatTableViewCell.identifier, bundle: nil)
        
        tableView.register(myXib, forCellReuseIdentifier: MyChatTableViewCell.identifier)
        tableView.register(othersXib, forCellReuseIdentifier: OthersChatTableViewCell.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
    }
}
extension DetailTravelChatViewController: UITableViewDelegate {
    
    
}

extension DetailTravelChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = chatList?[indexPath.row] else { return UITableViewCell() }
        
        if data.user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier, for: indexPath) as! MyChatTableViewCell
            
            cell.configureData(data)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: OthersChatTableViewCell.identifier, for: indexPath) as! OthersChatTableViewCell
            
            cell.configureData(data)
            
            return cell
        }
    }
}
