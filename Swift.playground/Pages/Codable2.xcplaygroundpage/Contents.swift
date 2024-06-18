//: [Previous](@previous)

import Foundation

let json = """
{
    "product_name": "영등포캠퍼스 캠핑카",
    "price": 123459000,
    "mall_name": "네이버"
}
"""
// ⏭️ String > Data > Struct // 도와주는 친구 : 프로토콜 (Decodable, 디코딩, 역직렬화)
// 서버 값과 구조체 값이 다르면 디코딩 실패
// 디코딩 실패하면 무조건 런타임 에러 발생
// => 옵셔널을 통해 런타임 오류를 방지할 '수'는 있다. 🆗

struct Product: Decodable {
    let productName: String?
    let price: Int?
    let mallName: String?
    
        
}

guard let result = json.data(using: .utf8) else {
    fatalError("변환실패")
}

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

do {
    let value = try decoder.decode(Product.self, from: result)
    print(value)
} catch {
    print(error)
}
print(result)

//: [Next](@next)
