//
//  CityInfoViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

class CityInfoViewController: UIViewController {
    
    @IBOutlet weak var cityNavBar: UINavigationBar!
    @IBOutlet weak var cityTableView: UITableView!
    
    var list = TravelInfo().travel
  
    // 하트 클릭 로직
    @objc func heartButtonClicked(_ sender: UIButton) {
        let index = sender.tag
        list[index].like?.toggle()
        cityTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .bottom)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
}

// MARK: CityInfoView UI 설정 관련
extension CityInfoViewController {
    func configureTableView() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        let xib = UINib(nibName: CityInfoTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: AdTableViewCell.identifier, bundle: nil)
        
        cityTableView.register(xib, forCellReuseIdentifier: CityInfoTableViewCell.identifier)
        cityTableView.register(xib2, forCellReuseIdentifier: AdTableViewCell.identifier)
        
        cityTableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: CityInfoView Table Delegate, DataSource
extension CityInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
        if !data.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoTableViewCell.identifier, for: indexPath) as! CityInfoTableViewCell
            cell.configureCell(data: data)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(heartButtonClicked), for: .touchUpInside)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as! AdTableViewCell
            cell.configureCell(data: data)
            return cell
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic) // 화면 갔다가 다시 원래 셀의 모양을 돌려줘
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        
        if data.ad {
            let vc = storyboard?.instantiateViewController(withIdentifier: "AdViewController") as! AdViewController
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.modalTransitionStyle = .coverVertical
            
            present(nav, animated: true)
            
        } else {
            let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            backBarButtonItem.tintColor = .black
            self.navigationItem.backBarButtonItem = backBarButtonItem
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "CityInfoDetailViewController") as! CityInfoDetailViewController
   
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
