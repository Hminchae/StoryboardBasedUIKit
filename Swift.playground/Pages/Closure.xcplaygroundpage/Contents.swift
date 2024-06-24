//: [Previous](@previous)

import Foundation

func studyiOS() {
    print("iOS")
    print("개발중")
}

let develop1 = studyiOS()
// ⬆️🟰⬇️
// ✅ Function Type: () -> Void

let develop2 = {
    print("iOS")
    print("개발중")
}
// ⬆️🟰⬇️
let develop3 = { () -> Void in // ✅ () -> Void : 클로저 헤더 ✅ in : 구분자, 구분용도(클로저 헤더와 바디)
    print("iOS")
    print("개발중") // ✅ 여기는 클로저 바디
}

func todayNumber(result: (Int) -> String){
    result(Int.random(in: 1...100))
}

/*
todayNumber(result: { (number: Int) -> String in
    return "행운의 숫자는 \(number)이다."
})
*/
// ⬆️🟰⬇️
/*
todayNumber(result: {
    return "행운의 숫자는 \($0)이다."
})
 */
// ⬆️🟰⬇️
todayNumber() { // ⬅️ 매개변수가 하나 이기때문에 이 형태가 가능!
    return "행운의 숫자는 \($0)이다."
})
//: [Next](@next)
