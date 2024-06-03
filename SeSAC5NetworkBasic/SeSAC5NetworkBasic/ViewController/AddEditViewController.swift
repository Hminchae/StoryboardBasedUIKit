//
//  AddEditViewController.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/3/24.
//

import UIKit

class AddEditViewController: UIViewController {
    
    var titleValue: String = ""
    var placeholder: String = ""
    
    @IBOutlet weak var topTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = titleValue
        topTextField.placeholder = placeholder
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
