//
//  SearchTableViewController.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/24/24.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var list: [Travel] = [
        Travel(country: "Japan",
               money: 2900000,
               like: false
              ),
        Travel(country: "Korea",
               money: 3900000,
               like: true
              ),
        Travel(country: "China",
               money: 3900000,
               like: false
              ),
        Travel(country: "United States",
               money: 3900000,
               like: false
              ),
        Travel(country: "India",
               money: 3900000,
               like: false
              ),
        Travel(country: "Indonesia",
               money: 3900000,
               like: false
              ),
        Travel(country: "Switzland",
               money: 3900000,
               like: false
              )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**
         # type casting
         as! 를 기준으로
         왼쪽 -> Scene
         as ->  연결
         오른쪽 -> Logic
         */
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for: indexPath) as! SearchTableViewCell
        let data = list[indexPath.row]

        cell.titleLabel.text = data.country
        cell.titleLabel.font = .boldSystemFont(ofSize: 25)
        
        cell.subtitleLabel.text = data.money.formatted()
        cell.subtitleLabel.font = .systemFont(ofSize: 14)
        cell.subtitleLabel.textColor = .label
        
        cell.posterImageView.layer.cornerRadius = 10
        cell.posterImageView.backgroundColor = .lightGray
        
        let likeImageName = data.like ? "heart.fill" : "heart"
        let likeImage = UIImage(systemName: likeImageName)
        
        cell.likeButton.setImage(likeImage, for: .normal)
        cell.likeButton.tintColor = .red
        cell.likeButton.tag = indexPath.row
        
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc private func likeButtonClicked(sender: UIButton) {
        let index = sender.tag
        list[index].like.toggle()
        
        // tableView.reloadData()는 전체를 다 reload하는데
        // 데이터가 4000개 이렇게 들어오게되면
        // 계속해서 reloadData로 불러오기 너무 아깝다
        //        tableView.reloadData()
        
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .bottom)
    }
}

struct Travel {
    let country: String
    let money: Int
    var like: Bool
    
    init(country: String, money: Int, like: Bool) {
        self.country = country
        self.money = money
        self.like = like
    }
}

