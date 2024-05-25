//
//  SearchRestaurantViewController.swift
//  TravelMagazine
//
//  Created by 황민채 on 5/26/24.
//

import UIKit

class SearchRestaurantViewController: UIViewController {
    @IBOutlet weak var storeListButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeListButton.setImage(UIImage(named: "foodButton"), for: .normal)
        // Do any additional setup after loading the view.
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
