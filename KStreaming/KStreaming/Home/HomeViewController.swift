//
//  HomeViewController.swift
//  KStreaming
//
//  Created by 황민채 on 6/2/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(
            UINib(nibName: HomeVideoTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: HomeVideoTableViewCell.identifier
        )
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        HomeSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = HomeSection(rawValue: section) else {
            return 0
        }
        
        switch section {
        case .video :
            return 2
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        guard let section = HomeSection(rawValue: indexPath.section) else {
//            return 0
//        }
//        switch section {
//        case .video :
//            return HomeVideoTableViewCell.height
//        }
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .video :
            return tableView.dequeueReusableCell(
                withIdentifier: HomeVideoTableViewCell.identifier,
                for: indexPath
            )
        }
    }
}
