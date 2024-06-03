//
//  ViewController.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/3/24.
//

import UIKit

struct User {
    let name: String
    let age: Int
    let bgColor: UIColor
    
    // 인스턴스, 연산
    var userAge: String {
        return "\(age)세"
    }
    
    init(name: String) {
        self.name = name
        self.age = .random(in: 1...100)
        self.bgColor = .random()
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let list: [User] = [
        User(name: "텔레토비"),
        User(name: "뚜비"),
        User(name: "나나"),
        User(name: "뽀"),
        User(name: "아기")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureBarButtonItem()
    }
    
    // self: 클래스의 인스턴스
    // delegate, datasource 프로퍼티는 프로토콜 자리...
    // 타입으로서의 프로토콜(Protocol as Type)
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let xib = UINib(nibName: BasicTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: BasicTableViewCell.identifier)
        
        tableView.rowHeight = 80
        tableView.separatorColor = .gray
    }
    
    func configureBarButtonItem() {
        let item = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func plusButtonClicked() {
        let vc = storyboard?.instantiateViewController(withIdentifier: AddEditViewController.identifier) as! AddEditViewController
        vc.type = .add
        
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
}

// Delegate, Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as! BasicTableViewCell
        
        let data = list[indexPath.row]
        cell.textLabel?.text = data.name
        cell.detailTextLabel?.text = data.userAge
        cell.backgroundColor = UIColor.random()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: AddEditViewController.identifier) as! AddEditViewController
        
        vc.type = .edit
        
        navigationController?.pushViewController(vc, animated: true)
        
//        let vc = storyboard?.instantiateViewController(withIdentifier: UserViewController.identifier) as! UserViewController
//
//        vc.data = list[indexPath.row]
//        
//        present(vc, animated: true)
    }
}
