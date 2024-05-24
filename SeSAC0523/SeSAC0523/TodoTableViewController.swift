//
//  TodoTableViewController.swift
//  SeSAC0523
//
//  Created by 황민채 on 5/24/24.
//

import UIKit

class TodoTableViewController: UITableViewController {
    var list = ["장보기", "영화보기", "과제하기", "복습하기", "잠자기"]
    
    @IBOutlet weak var addTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
    }
    // 2. addButton 클릭 > textField text 가져오기 > list append
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return list.count // implicit return
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        cell.detailTextLabel?.text = "ㅇ림아ㅓㄹ"
    
        return cell
    }
    
    @objc
    func addButtonClicked() {
        guard let text = addTextField.text, text.count > 1 else {
            print("두 글자 이상 입력하셈")
            return
        }
        
        list.append(text)
        if addTextField.text!.isEmpty {
            print("같아용")
        }
        
        list.append(text)
            addTextField.text = ""
    
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        list.remove(at: indexPath.row)
        
        tableView.reloadData()
    }
}
