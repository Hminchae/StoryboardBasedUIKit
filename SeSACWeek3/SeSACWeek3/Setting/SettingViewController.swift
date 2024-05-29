//
//  SettingViewController.swift
//  SeSACWeek3
//
//  Created by 황민채 on 5/28/24.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView("설정")
    }

    @IBAction func presentModal(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        // 3. 화면 띄우기
        present(vc, animated: true)
    }
    
    @IBAction func presentFullScreen(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        // 2-1. 화면 옵션
        // fullScreen은 dismiss를 직접 구현해주어야 함
        vc.modalPresentationStyle = .fullScreen // default 는 automatic
        // present 방식에서 화면을 띄울 때 애니메이션
        vc.modalTransitionStyle = .partialCurl // default는 .coverVertical
        // !! modalTransitionStyle은 옵션 종류에 따라 동작이 안 되거나 런타임 이슈가 발생할 수 있음
        // 3. 화면 띄우기
        present(vc, animated: true)
    }
    @IBAction func presentNavigation(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        // 2-1. 네비게이션 컨트롤러 임베드
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .flipHorizontal
        // 3. 화면 띄우기
        present(nav, animated: true)
    }
    @IBAction func pushShow(_ sender: UIButton) {
        // 1. 스토리보드 가져오기
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        // 2. 스토리보드 내 전환하고자 하는 화면 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "BrownViewController") as! BrownViewController
        // 3. 화면 띄우기 : push Show 의 경우엔 네비게이션 컨트롤러 프로퍼티를 가져온다.
        // 컨트롤러 없으면 화면전환 X
        // 스토리보드에서 네비게이션 컨트롤러가 임베드 되어있지 않으면 push 안됨
        navigationController?.pushViewController(vc, animated: true)
    }
}
