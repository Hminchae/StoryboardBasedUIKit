//
//  Snap2ViewController.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/4/24.
//

import UIKit
import SnapKit

class Snap2ViewController: UIViewController {
    
    let redView = UIView()
    let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierachy()
        configureLayout()
        configureUI()
    }
    
    func configureHierachy() {
        let array = [blueView, redView] // addSubview의 순서가 뷰 계층 구조가 쌓이는데 가장 중요함
        
        view.addSubview(redView)
        redView.addSubview(blueView)
    }
    
    func configureLayout() {
        redView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            //            make.width.equalTo(300)
            //            make.height.equalTo(300)
            
            //            make.width.height.equalTo(300)
            
            make.size.equalTo(300)
        }
        
        blueView.snp.makeConstraints { make in
            //            make.top.equalTo(view.safeAreaLayoutGuide)
            //            make.bottom.equalTo(view.safeAreaLayoutGuide)
            //            make.trailing.equalTo(view.safeAreaLayoutGuide)
            //            make.leading.equalTo(view.safeAreaLayoutGuide)
            //            make.horizontalEdges.verticalEdges.equalTo(view.safeAreaLayoutGuide)
            
            //make.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            
            //make.edges.equalTo(view.safeAreaLayoutGuide)
            
            make.edges.equalToSuperview().inset(50)
            
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        
    }
}
