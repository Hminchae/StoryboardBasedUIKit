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
    @IBOutlet weak var searchTextfieldButton: UIButton!
    
    @IBOutlet weak var storeCategory1: UIButton!
    @IBOutlet weak var storeCategory2: UIButton!
    @IBOutlet weak var storeCategory3: UIButton!
    @IBOutlet weak var storeCategory4: UIButton!
    
    @IBOutlet weak var closeStoreSortButton: UIButton!
    @IBOutlet weak var bookmarkStoreButton: UIButton!
    
    var closeOrBookmarkState: Bool = true
    
    var restaurantInfo: [Restaurant] = RestaurantList().restaurantArray
    let tempArray: [Restaurant] = RestaurantList().restaurantArray // 임시 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchRestaurantTitle.text = "맛집 정보"
        SearchRestaurantTitle.font = UIFont(name: "Pretendard-SemiBold", size: 28)
        
        searchTextfieldView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        searchTextfieldView.layer.cornerRadius = 5
        
        searchTextfield.placeholder = "검색"
        searchTextfield.borderStyle = .none
        
        searchTextfieldButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchTextfieldButton.setTitle("", for: .normal)
        searchTextfieldButton.tintColor = .darkGray
        designCategoryButton(categoryButtonName: storeCategory1, "한식")
        designCategoryButton(categoryButtonName: storeCategory2, "카페")
        designCategoryButton(categoryButtonName: storeCategory3, "중식")
        designCategoryButton(categoryButtonName: storeCategory4, "기타")
        
        closeStoreSortButton.setTitle("가까운 매장", for: .normal)
        closeStoreSortButton.tintColor = .label
        
        bookmarkStoreButton.setTitle("저장한 매장", for: .normal)
        bookmarkStoreButton.tintColor = .darkGray
        
        tableView.indicatorStyle = .white
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantInfo.count
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
        cell.storeTitle.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        
        // 주소 버튼 클릭 시
        cell.addressButton.addTarget(self, action: #selector(addressButtonClicked), for: .touchUpInside)
        cell.addressButton.tag = indexPath.row
        
        // 전화 버튼 클릭 시
        cell.numberButton.addTarget(self, action: #selector(numberButtonClicked), for: .touchUpInside)
        cell.numberButton.tag = indexPath.row
        
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
    
    // 주소 & 전화 버튼 클릭 시 알럿
    func showAlert(messageStr: String, kind: String) {
        let alert = UIAlertController(title: kind, message: messageStr, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // 주소 버튼 클릭 시
    @objc func addressButtonClicked(sender: UIButton) {
        let index = sender.tag
        // print(restaurantInfo[index].address)
        showAlert(messageStr: restaurantInfo[index].address, kind: "주소")
    }
    
    // 전화 버튼 클릭 시
    @objc func numberButtonClicked(sender: UIButton) {
        let index = sender.tag
        // print(restaurantInfo[index].address)
        showAlert(messageStr: restaurantInfo[index].phoneNumber, kind: "전화번호")
    }
    // 북마크 버튼 클릭시 색 변경 함수
    @objc func bookMarkButtonClicked(sender: UIButton) {
        let index = sender.tag
        
        restaurantInfo[index].bookmark.toggle()
        
        tableView.reloadData()
    }
    
    // 카테고리 검색 버튼 디자인 함수
    func designCategoryButton(categoryButtonName button: UIButton, _ categoryName: String) {
        button.setTitle(categoryName, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 13)
        button.setTitleColor(.label, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .white.withAlphaComponent(0.1)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    // 통합 검색 함수
    func searchRestaurant(target: String) {
        var newInfoArray: [Restaurant] = []
        
        // 카테고리 검색
        for i in restaurantInfo {
            if i.category == target {
                newInfoArray.append(i)
            }
        }
        
        // 가게명 검색
        for i in restaurantInfo {
            if i.name.hasPrefix(target) {
                newInfoArray.append(i)
            }
        }
        restaurantInfo = newInfoArray
        tableView.reloadData()
    }
    
    // 기타 검색 함수
    private func searchEtcRestaurant() {
        var newInfoArray: [Restaurant] = []
        
        // 카테고리 검색
        for i in restaurantInfo {
            if i.category == "분식" {
                newInfoArray.append(i)
            } else if i.category == "일식" {
                newInfoArray.append(i)
            } else if i.category == "경양식" {
                newInfoArray.append(i)
            } else if i.category == "양식" {
                newInfoArray.append(i)
            }
        }
        
        restaurantInfo = newInfoArray
        tableView.reloadData()
    }
    
    // 카테고리 검색 중 한식 버튼
    @IBAction func koreaFoodButtonClicked(_ sender: UIButton) {
        restaurantInfo = tempArray
        searchRestaurant(target: "한식")
    }
    
    // 카테고리 검색 중 카페 버튼
    @IBAction func cafeButtonClicked(_ sender: UIButton) {
        restaurantInfo = tempArray
        searchRestaurant(target: "카페")
    }
    
    // 카테고리 검색 중 중식 버튼
    @IBAction func chinaFoodButtonClicked(_ sender: UIButton) {
        restaurantInfo = tempArray
        searchRestaurant(target: "중식")
    }
    
    // 카테고리 검색 중 기타 버튼
    @IBAction func etcFoodButtonClicked(_ sender: UIButton) {
        restaurantInfo = tempArray
        searchEtcRestaurant()
    }
    
    // 검색창 돋보기 버튼
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        if let text = searchTextfield.text {
            searchRestaurant(target: text)
        }
    }
    
    // 가까운 매장 버튼
    @IBAction func closeStoreButtonClicked(_ sender: UIButton) {
        closeOrBookmarkState = true
        closeStoreSortButton.tintColor = .label
        bookmarkStoreButton.tintColor = .darkGray
    }
    
    // 저장한 매장 버튼
    @IBAction func bookmarkStoreButtonClicked(_ sender: UIButton) {
        closeOrBookmarkState = false
        closeStoreSortButton.tintColor = .darkGray
        bookmarkStoreButton.tintColor = .label
    }
}
