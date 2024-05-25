//
//  SearchRestaurantTableViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/26/24.
//

import UIKit
import Kingfisher

class SearchRestaurantTableViewController: UITableViewController {
    @IBOutlet weak var SearchRestaurantTitle: UILabel!
    
    @IBOutlet weak var storeCategory1: UIButton!
    @IBOutlet weak var storeCategory2: UIButton!
    @IBOutlet weak var storeCategory3: UIButton!
    @IBOutlet weak var storeCategory4: UIButton!
    
    var restaurantInfo: [Restaurant] = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchRestaurantTitle.text = "맛집 정보"
        SearchRestaurantTitle.font = UIFont(name: "Pretendard-SemiBold", size: 28)
        
        designCategoryButton(categoryButtonName: storeCategory1, "한식")
        designCategoryButton(categoryButtonName: storeCategory2, "카페")
        designCategoryButton(categoryButtonName: storeCategory3, "중식")
        designCategoryButton(categoryButtonName: storeCategory4, "기타")
        tableView.indicatorStyle = .white
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantInfo.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(#function)
        return 180
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let store = restaurantInfo[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchRestaurant", for: indexPath) as! SearchRestaurantTableViewCell
        
        // 사진
        let url = URL(string: store.image)
        cell.storeImage.kf.setImage(with: url)
        cell.storeImage.contentMode = .scaleAspectFill
        cell.storeImage.layer.cornerRadius = 5
        
        // 음식점 명
        cell.storeTitle.text = store.name
        cell.storeTitle.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        
        // 음식점 주소
        cell.storeAddress.text = store.address
        cell.storeAddress.font = UIFont(name: "Pretendard-Medium", size: 13)
        cell.storeAddress.numberOfLines = 0
        cell.storeAddress.textColor = .darkGray
        
        // 음식점 전화번호
        cell.storeNumber.text = "문의 : \(String(store.phoneNumber))"
        cell.storeNumber.font = UIFont(name: "Pretendard-Medium", size: 11)
        cell.storeNumber.textColor = .darkGray
        
        // 음식점 카테고리 & 가격
        cell.storeCategory.text = "\(store.category)﹒대표메뉴 가격: \(String(store.price))원"
        cell.storeCategory.font = UIFont(name: "Pretendard-Medium", size: 13)
        cell.storeCategory.textColor = .lightGray
        
        cell.storeStarButton.addTarget(self, action: #selector(bookMarkButtonClicked), for: .touchUpInside)
        
        // 음식점 즐겨찾기 버튼
        var bookmarkState: UIImage = store.bookmark ? UIImage(systemName: "bookmark.fill")! : UIImage(systemName: "bookmark")!
        cell.storeStarButton.setImage(bookmarkState, for: .normal)
        cell.storeStarButton.setTitle("", for: .normal)
        
        cell.storeStarButton.tag = indexPath.row
        return cell
    }
    
    @objc func bookMarkButtonClicked(sender: UIButton) {
        let index = sender.tag
        
        restaurantInfo[index].bookmark.toggle()
        
        tableView.reloadData()
    }
    
    func designCategoryButton(categoryButtonName button: UIButton, _ categoryName: String) {
        button.setTitle(categoryName, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 13)
        button.setTitleColor(.label, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .white.withAlphaComponent(0.1)
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.8984585404, green: 0.3958421052, blue: 0.3318128884, alpha: 1).cgColor
    }
}
