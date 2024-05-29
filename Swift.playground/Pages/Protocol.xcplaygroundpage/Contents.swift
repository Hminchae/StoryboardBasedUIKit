//: [Previous](@previous)

import UIKit

/* MARK: 프로토콜 클래스/구조체/열거형
 - 상속 아님
 - 클래스 전체를 책임지지 않고, 특정 뷰나 기능에 대한 요소를 담당
 - 필수 요구사항은 모두 다 구현을 해주어야 함
 - 필수 요구사항(Requirement)은 모두 다 구현을 해주어야 함
    - Property Requirements
    - Method Requirements
    - Optional Requirements
 - 프로토콜은 구현은 안 함!
*/

// 어떻게 코드(delegate, datasource)를 안 쓰면 오류가 나지?
protocol minchaeTableViewProtocol {
    func number() -> Int
    func cellForRowAt(indexPath: IndexPath)
    
}

// 선언만 해두고, 구현은 하지 않아요.
// 10개중에 하나 정도는 가끔 사용하는데 이거 어케 못함?
// -> 옵셔널 프로토콜 : 프로토콜과 func 앞에 @objc 를 작성한다.
@objc
protocol ViewControllerConfiguration {
    func configureView()
    @objc optional func configureTableView()
    func configureLayout()
}

class FoodViewController: UIViewController {
    func configureView(a: Int) {
        <#code#>
    }
    
}

// -> 프로토콜을 따라야 하는 코드들을 Extension 으로 확장해 구현해두면 코드가 깔끔해진다.
extension FoodViewController: ViewControllerConfiguration {
    func configureView() {
        <#code#>
    }
    
    func configureTableView() {
        <#code#>
    }
    
    func configureLayout() {
        <#code#>
    }
}

class Sample: minchaeTableViewProtocol {
    func number() -> Int {
        <#code#>
    }
    
    func cellForRowAt(indexPath: IndexPath) {
        <#code#>
    }
}
//: [Next](@next)
