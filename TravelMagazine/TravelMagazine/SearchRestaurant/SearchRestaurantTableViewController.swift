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
    
    @IBOutlet weak var searchTextfieldView: UIView!
    @IBOutlet weak var searchTextfield: UITextField!
    
    @IBOutlet weak var storeCategory1: UIButton!
    @IBOutlet weak var storeCategory2: UIButton!
    @IBOutlet weak var storeCategory3: UIButton!
    @IBOutlet weak var storeCategory4: UIButton!
    
    @IBOutlet weak var closeStoreSortButton: UIButton!
    @IBOutlet weak var bookmarkStoreButton: UIButton!
    
    var closeOrBookmarkState: Bool = true
    
    var restaurantInfo: [Restaurant] = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchRestaurantTitle.text = "맛집 정보"
        SearchRestaurantTitle.font = UIFont(name: "Pretendard-SemiBold", size: 28)
        
        searchTextfieldView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        searchTextfieldView.layer.cornerRadius = 5
        
        searchTextfield.placeholder = "검색"
        searchTextfield.borderStyle = .none
        
        designCategoryButton(categoryButtonName: storeCategory1, "한식")
        designCategoryButton(categoryButtonName: storeCategory2, "카페")
        designCategoryButton(categoryButtonName: storeCategory3, "중식")
        designCategoryButton(categoryButtonName: storeCategory4, "기타")
        
        closeStoreSortButton.setTitle("가까운 매장", for: .normal)
        closeStoreSortButton.tintColor = .label
        
        bookmarkStoreButton.setTitle("저장한 매장", for: .normal)
        bookmarkStoreButton.tintColor = .darkGray
        
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
        
//        // 음식점 주소
//        cell.storeAddress.text = store.address
//        cell.storeAddress.font = UIFont(name: "Pretendard-Medium", size: 13)
//        cell.storeAddress.numberOfLines = 0
//        cell.storeAddress.textColor = .darkGray
//        
//        // 음식점 전화번호
//        cell.storeNumber.text = "☎ \(String(store.phoneNumber))"
//        cell.storeNumber.font = UIFont(name: "Pretendard-Medium", size: 11)
//        cell.storeNumber.textColor = .darkGray
        
        // 음식점 카테고리 & 가격
        cell.storeCategory.text = "\(store.category)﹒대표메뉴 가격: \(String(store.price))원"
        cell.storeCategory.font = UIFont(name: "Pretendard-Medium", size: 13)
        cell.storeCategory.textColor = .lightGray
        
        cell.storeStarButton.addTarget(self, action: #selector(bookMarkButtonClicked), for: .touchUpInside)
        
        // 음식점 즐겨찾기 버튼
        var bookmarkState: UIImage = store.bookmark ? UIImage(systemName: "bookmark.fill")! : UIImage(systemName: "bookmark")!
        cell.storeStarButton.setImage(bookmarkState, for: .normal)
        cell.storeStarButton.setTitle("", for: .normal)
        cell.storeStarButton.tintColor = .darkGray
        
        cell.storeStarButton.tag = indexPath.row
        
        cell.addressButton.setImage(UIImage(systemName: "storefront"), for: .normal)
        cell.addressButton.setTitle("", for: .normal)
        cell.addressButton.tintColor = .darkGray
        
        cell.numberButton.setImage(UIImage(systemName: "phone"), for: .normal)
        cell.numberButton.setTitle("", for: .normal)
        cell.numberButton.tintColor = .darkGray
        
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
        button.layer.cornerRadius = 5
        button.backgroundColor = .white.withAlphaComponent(0.1)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
    }
    @IBAction func closeStoreButtonClicked(_ sender: UIButton) {
        closeOrBookmarkState = true
        closeStoreSortButton.tintColor = .label
        bookmarkStoreButton.tintColor = .darkGray
    }
    
    @IBAction func bookmarkStoreButtonClicked(_ sender: UIButton) {
        closeOrBookmarkState = false
        closeStoreSortButton.tintColor = .darkGray
        bookmarkStoreButton.tintColor = .label
    }
}
