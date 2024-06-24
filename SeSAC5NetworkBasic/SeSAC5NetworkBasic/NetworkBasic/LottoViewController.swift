//
//  LottoViewController.swift
//  SeSAC5NetworkBasic
//
//  Created by 황민채 on 6/4/24.
//

import UIKit
import Alamofire

/*
 ✅ 할일 1. responseString 으로 print 되는 내용을 어떻게 화면에 띄우지?
 String => Struct (Decoding) => View
 ✅ 할일 2. 코드 실행순서 이해하기 -> 네트워크 응답을 받는데 5초도 걸릴 수 있다.
    
 */

struct Lotto: Decodable {
    let totSellamnt: Int
    let drwNo: Int
}

class LottoViewController: UIViewController {
    let url = "https://dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1109"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        NetworkManager.shared.getLotto("1105") { value in
            self.title = "\(value)ㅋㅋ"
            
        }
    }
}

//AF.request(url).responseString { response in
//    switch response.result {
//        
//    case .success(let value):
//        print(value)
//    case .failure(let error):
//        print(error)
//    }
//}
