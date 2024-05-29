import UIKit
/*
 연산 프로퍼티
 - 말 그대로 연산만 해주는 통로? 같은 역할
 - 연산 프로퍼티는 그래서 초기화 구문이 필요가 없고, 메모리 공간을 차지하지 않음
 - 다른 저장 프로퍼티의 값을 가지고 연산을 한다.
 - 그래서 연산 프로퍼티는 보통 저장 프로퍼티가 필요함.
 */
struct BMI {
    var weight: Double = 50
    var height: Double = 150 // 인스턴스 저장 프로퍼티
    
    var BMIResult: String {
        let value = (bmi.weight * bmi.weight) / height
        let result = value < 18.5 ? "저체중" : "정상 이상"
        
        return "\(result)입니다."
    }
}


let bmi = BMI()
bmi.BMIResult

let value = (bmi.weight * bmi.weight) / bmi.height
let result = value < 18.5 ? "저체중" : "정상 이상"
print("\(result)입니다.")


class User {
    static let team = "SeSAC" // 타입 프로퍼티 -> 앱을 종료하기 전까지 계속 사용하는 공간"
    
    let name: String // 인스턴스 프로퍼티
    let age: Int // 인스턴스 프로퍼티
    
    init(name: String, age: Int) { // 값이 비어 있어 초기화 구문이 필요하기 때문
        self.name = name
        self.age = age
        print("내가 초기화 되었다~")
    }
    
    deinit {
        print("내가 소멸되었다~")
    }
}

//let thanky = User(name: "황민채", age: 28)
var thanky: User? = User(name: "황민채", age: 28)
thanky?.name

thanky = nil

User.team //<= 클래스 자체에서 접근 가능하면 타입 프로퍼티

//var hue: User?
//
//hue = User(name: "hue", age: 21)
//hue?.age

/*
 지연 저장 프로퍼티
 - 인스턴스가 생성되었더라도, lazy 가 선언되어 있다면 이 프로퍼티는 사용 시점에 초기화가 된다.
 - 즉 인스턴스 생성 시점과 무관
 - 즉 사용하지 않으면 초기화 되지 않는다.
 - 즉 메모리 공간을 차지하지 않는다
 - lazy 는 var 와 함께 사용한다.
 */

struct Media {
    let title = "극한 직업" // 저장 프로퍼티, 인스턴스 프로퍼티
    var runtime = 123 // 저장 프로퍼티, 인스턴스 프로퍼티
    lazy var video = Video() // 나 초기화 필요할 때만 해주면 안되나? -> lazy, 지연 저장 프로퍼티, 인스턴스 프로퍼티
    
    init() {
        print("Media init")
    }
}

struct Video {
    var image = UIImage(systemName: "star")
    
    init() {
        print("Video init")
    }
}

// 인스턴스 생성을 통해서 메모리에 올라간 상태
var first = Media()
first.runtime // 프로퍼티 - 인스턴스 프로퍼티
first.title
print("탐색중")
first.video // 이때 lazy var video 저장됨

var second = Media()
second.runtime = 345

let third = Media()



