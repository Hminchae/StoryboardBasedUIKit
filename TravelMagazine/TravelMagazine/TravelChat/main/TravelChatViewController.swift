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
    
    @IBOutlet weak var tableView: UITableView!
    
    let list: [ChatRoom] = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "TRAVEL CHAT"
        tableView.separatorStyle = .none
        configureLayout()
        configureTableView()
    }
}

extension TravelChatViewController {
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
         
        let xib = UINib(nibName: TravelChatTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: TravelChatTableViewCell.identifier)
    }
}
extension TravelChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        
        defer {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailTravelChatViewController") as! DetailTravelChatViewController
        
        print(data.chatList)
        vc.chatList = data.chatList
        let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true)
    }
}

extension TravelChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let data = list[index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelChatTableViewCell.identifier, for: indexPath) as! TravelChatTableViewCell
         
        cell.configureCellData(data)
        
        return cell
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
