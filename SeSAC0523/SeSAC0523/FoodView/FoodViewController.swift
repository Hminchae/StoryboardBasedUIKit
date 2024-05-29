//
//  FoodViewController.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/27/24.
//

import UIKit
// 1. tableView 아울렛 선언
// 2. tableView 부하직원 선언
// 3. 부하직원과 tableView 연결: 타입으로서의 Protocol
// 4. XIB Cell: 여러 테이블 뷰에 재사용
// 5. XIB
class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var list = RestaurantList().restaurantArray
    var filteredList: [Restaurant] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for:indexPath) as! FoodTableViewCell
        let data = filteredList[indexPath.row]
        
        //cell.configureLayout() -> awakeFromNib 에서 구현
        cell.configureCell(data: data)
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        
        let left = UIBarButtonItem(title: "한식만", style: .plain, target: self,  action: #selector(leftBarbuttonClicked))
        let all = UIBarButtonItem(title: "전체보기", style: .plain, target: self,  action: #selector(allBarbuttonClicked))
        navigationItem.leftBarButtonItems = [left, all]
        
        filteredList = list
        
        searchBar.delegate = self // 부하직원 연결
        foodTableView.rowHeight = 120
        foodTableView.delegate = self
        foodTableView.dataSource = self
        let xib = UINib(nibName: "FoodTableViewCell", bundle: nil)
        foodTableView.register(xib, forCellReuseIdentifier: "FoodTableViewCell")
    }
    @objc func leftBarbuttonClicked() {
        // list 중에서 한식에 해당하는 음식만 가지고 오기
        var koreanFood: [Restaurant] = []
        for item in list {
            if item.category == "한식" {
                koreanFood.append(item)
            }
        }
        filteredList = koreanFood
        showAlert(title: "한식 버튼을 클릭하셨습니다.")
        foodTableView.reloadData()
    }
    
    @objc func allBarbuttonClicked() {
        // 다시 전체보기
        filteredList = list
        foodTableView.reloadData()
        showAlert(title: "전체보기로 설정하셨습니다.")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var searchList: [Restaurant] = []
        for item in list {
            if item.name.contains( searchBar.text!) || item.category.contains(searchBar.text!) {
                searchList.append(item)
            }
        }
        filteredList = searchList
        foodTableView.reloadData()
    }
}
