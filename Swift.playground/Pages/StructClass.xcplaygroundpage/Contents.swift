import UIKit

// 1. 오류가 생기고 실행이 안 되는 이유
//var nickname: String
//print(nickname)

// 2. 옵셔널 스트링일 때는 괜찮은 이유
var nickname: String?
print(nickname)

// nil을 못가지고 무조건 String
// 사용하기 전에 초기화가 되어 있어야 한다.
var nickName = "황민채"
print(nickName)


var list = ["오밥", "선식당", "유미카츠"]
var list2 = ["456-789", "345-384", "3423-2987"]

list[0]
list2[0]

// 1. 프로퍼티가 모드 초기화가 된 상태 => 초기화 구문 필요 X
// 2. 하나라도 선언만 되어 있고 초기화가 되어 있지 않다면 발생!!!!!1!!
// 옵셔널 타입인 경우에는 nil 값을 표현할 수 잇기 때문에 오류가 발생하지 않는다.
//class Monster {
//    var clothes = "Orange" // 인스턴스 프로퍼티
//    var speed = 1
//    var power = 1
//    var exp = 1
//}
//
//
//let minchae = Monster()
//minchae.clothes // get
//let mincae = Monster()
//minchae.clothes

//3. 초기화 구문이 필요한 이유
class Monster {
    var clothes: String // 인스턴스 프로퍼티
    var speed: Int
    var power: Int
    var exp: Int
    
    func attack() { // 인스턴스 메서드
        print("공격")
    }
    init(clothes: String, speed: Int, power: Int, exp: Int) {
        self.clothes = clothes
        self.speed = speed
        self.power = power
        self.exp = exp
    }
}

class BossMonster: Monster {

    
    func bossAtack() { // 인스턴스 메서드
        print("공격")
    }
    // 부모클래스에서 상속받은 기능을 오버라이딩해서 사용하게 되면 부모 클래스의 기능은 사용하지 않는다.
    // override vs overload
    override func attack() {
        print("오버라이딩 공격")
    }
}

let boss = BossMonster(clothes: "Green", speed: 100, power: 100, exp: 200)

boss.bossAtack()

//--------------------------------------------
// -> 초기값 없어서 오류남
//class User {
//    var nickname: String
//    var weight: Double
//    var height: Double
//}

// -> 초기화 구문을 제공해주기 때문에 Struct에서는 init을 안 써도 괜찮음. 그래서 클래스처럼 오류가 나지는 않는다.
// 멤버와이즈 초기화 구문
// 이니셜라이저와 멤버와이즈 이니셜라이저 designate initialize
struct User {
    var nickname: String
    var weight: Double
    var height: Double
}
