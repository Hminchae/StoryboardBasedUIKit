//
//  HomeViewController.swift
//  SeSACWeek3
//
//  Created by 황민채 on 5/28/24.
//

import UIKit

/*
 1. tableView 아울렛 선언
 2. UITableViewDelegate 와 UITableViewDataSource - 2개
 3. delegate = self, datasource = self
 */

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var userTextfield: UITextField!
    
    @IBOutlet weak var firstFilterButton: UIButton!
    @IBOutlet weak var secondFilterButton: UIButton!
    @IBOutlet weak var thirdFilterButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var buttonList = [firstFilterButton, secondFilterButton, thirdFilterButton] // 나중에 초기화하겠다~
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SampleTableViewCell.identifier, for:indexPath) as! SampleTableViewCell
        
        return cell
    }

    func configareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: SampleTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: SampleTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView("홈")
        configareTableView()
        
        tableView.rowHeight = 120
        
    }
}
