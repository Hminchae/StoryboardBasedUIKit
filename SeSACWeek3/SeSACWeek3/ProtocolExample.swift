//
//  ProtocolExample.swift
//  SeSACWeek3
//
//  Created by 황민채 on 5/29/24.
//

import UIKit

@objc
protocol ViewControllerConfiguration {
    func configureView()
    @objc optional func configureTableView()
    func configureLayout()
}

//class FoodViewController: ViewControllerConfiguration {
//    func configureView() {
//        <#code#>
//    }
//    
//    func configureTableView() {
//        <#code#>
//    }
//    
//    func configureLayout() {
//        <#code#>
//    }
//    
//
//}
