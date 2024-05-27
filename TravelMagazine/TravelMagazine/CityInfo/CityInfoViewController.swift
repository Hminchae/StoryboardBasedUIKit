//
//  CityInfoViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/27/24.
//

import UIKit

class CityInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cityNavBar: UINavigationBar!
    @IBOutlet weak var cityTableView: UITableView!
    
    var list = TravelInfo().travel
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
        if !data.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityInfoTableViewCell", for: indexPath) as! CityInfoTableViewCell
            cell.configureCell(data: data)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(heartButtonClicked), for: .touchUpInside)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            cell.configureCell(data: data)
            return cell
        }
    }
    
    @objc func heartButtonClicked(_ sender: UIButton) {
        let index = sender.tag
        list[index].like?.toggle()
        cityTableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .bottom)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.rowHeight = 145
        let xib = UINib(nibName: "CityInfoTableViewCell", bundle: nil)
        let xib2 = UINib(nibName: "AdTableViewCell", bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: "CityInfoTableViewCell")
        cityTableView.register(xib2, forCellReuseIdentifier: "AdTableViewCell")
    }
}
