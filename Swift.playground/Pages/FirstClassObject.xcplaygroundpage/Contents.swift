//: [Previous](@previous)

import Foundation
// ✏️First Class Object:  1. 변수/상수 2. 매개변수 3. 반환값
// ✅Function Type

/*
// 매개변수 X 반환값 X
func hello() {
    print("안녕하세용")
}

// 매개변수 X 반환값 O
func hello() -> String {
    return "안녕하세요"
}

// 매개변수 O, 반환값 O
func hello(name: String) -> String {
    return "\(name)님, 안녕하세요"
}
*/
//-----------------------------------------------------------------------
// 😵함수 자체를 상수에 담은게 아니라,
// ⬇️함수를 실행해서 나온 String이라는 반환값을 담은 것
// let result = hello(name: "고래밥")
// print(result) // "고래밥님, 안녕하세요\n"
// myLabel.text = result

// ⬇️그럼 얘는?
// let result = hello // <- (String) -> String : Function Type

// ✏️Function Type
/*
// 매개변수 X 반환값 X ➡️ () -> Void
func hello() -> Void {
    print("안녕하세용")
}
// 매개변수 O 반환값 X ➡️ (String, Int) -> Void
func hello(name: String, age: Int) -> {
    return "안녕하세요"
}

// 매개변수 X 반환값 O ➡️ () -> String
func hello() -> String {
    return "안녕하세요"
}

// 매개변수 O, 반환값 O ➡️ (String) -> String
func hello(name: String) -> String {
    return "\(name)님, 안녕하세요"
}

*/
//-----------------------------------------------------------------------
// 매개변수 O, 반환값 O ➡️ (String) -> String
func hello(name: String) -> String {
    return "\(name)님, 안녕하세요"
}

// ⬇️ 이 친구가 추가되면
func hello() -> Void {
    print("안녕하세용")
}
// ⬇️ 오버로딩 때문에 함수 타입이 무엇인지 구분하기가 어려워짐
// let result = hello // 🤔 이 친구는 실행은 안 되겠군! ✅(String) -> String
// ➡️➡️➡️ 🥳 타입 어노테이션으로 함수 타입을 직접 선언하여 해결
// let result: (String) -> String = hello

// ⬇️ 그럼 얘는???????? 🤔🤔🤔🤔
func hello(nickname: String) -> Void {
    print("안녕하세용")
}
// ➡️➡️➡️ 🥳 함수의 식별자로 함수를 구별
// 🧡함수가 오버로딩 되었을 때, 매개변수를 식별자로 하여 구별할 수 있다.
let result: (String) -> String = hello(name:) // ⬅️ 이렇게!

result("메롱")

//func number(base: Int) {
//    if base.isMultiple(of: 2) {
//        print("짝수")
//    } else {
//        print("홀수")
//    }
//}
func oddNumber() { // ➡️ () -> Void
    print("홀수")
}

func evenNumber() { // ➡️ () -> Void
    print("짝수")
}

// even 이라는 매개변수에다,
// 매개변수도 없고 반환값도 없는 임의의 함수가 들어감!
func number(base: Int, odd: () -> Void, even: () -> Void) {
    return base.isMultiple(of: 2) ? even()  : odd() // ⬅️ 이미 실행을 시키고 있기 때문에
}

number(base: 10, odd: oddNumber, even: evenNumber) // ⬅️ 실행없이 함수명만 보내도 됨
number(base: 9, odd: hello, even: evenNumber)
// ⬇️ 이름 없는 함수(익명함수)를 주로 사용
number(base: 4) {
    print("홀수지롱")
} even: {
    print("짝수지룡")
}

number(base: 11,
odd: {
    print("이이잉 ?")
}, even: {
    print("이이이...")
})
























//: [Next](@next)
