//: [Previous](@previous)

import UIKit

// 프로토콜에서는 연산 프로퍼티로 쓸 지, 저장 프로퍼티로 쓸 지 관여 X
protocol ViewConfiguration {
    var name: String { get } // 최소 조건. 더 구현하는 건 상관 X
    func a()
}
struct User {
    
    static let country = "한국" // 공간을 낭비하지 않게 하고 싶어.. : 초기화 구문에 필요도 없어~ 타입 프로퍼티(Swift Meta Type), 저장 프로퍼티
    
    let name: String // 인스턴스 저장 프로퍼티
    let age: Int // 인스턴스 저장 프로퍼티
    var money: String
    
    var introduce: String {
        get { // 값을 가지고 옴 : get 생략도 가능하다.
            return "제 이름은 \(name)이고, 나이는 \(age)입니다."
        }
        set { // 값을 넣어주는 역할 : 생략할 수 없고 get이 생략되어 있어서도 안됨
            let result = newValue + "원"
            money = result
        }
    }
    
    var introduce2: String {
        "제 이름은 \(name)이고, 나이는 \(age)입니다."
    }
    
    var introduce3: String {
        return "제 이름은 \(name)이고, 나이는 \(age)입니다."
    }
}

User.country

var thanky = User(name: "황민채", age: 28, money: "10000") // 인스턴스
//--------------연산 프로퍼티 사용 예---------
print("제 이름은 \(thanky.name)이고, 나이는 \(thanky.age)입니다.")
// 를
print(thanky.introduce)
// 로 사용할 수 있음

print(thanky.money)


let sesac = User(name: "새싹이", age: 1, money: "1000") // 인스턴스



//--------------- 연산 프로퍼티 set 사용 예----
// 닉네임, 나이, 연락처, 이메일
UserDefaults.standard.set("고래밥", forKey: "nickname")

struct UserDefaultsHelper: ViewConfiguration {
    var name: String {
        return "rrrr"
    }
    
    func a() {

    }
    
    var nickname: String {
        get {
            return  UserDefaults.standard.string(forKey: "nickname") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "nickname")
        }
    }
    
    var age: Int {
        get {
            return  UserDefaults.standard.integer(forKey: "age") ?? 0
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "age")
            newValue.formatted(.number)
        }
    }
}

// VC
var helper = UserDefaultsHelper()
helper.nickname
helper.nickname = "칙촉"

print(thanky.money)
thanky.introduce = "83791874098"
thanky.money
//// 연산 프로퍼티 Set
//thanky.introduce = ""







//: [Next](@next)
