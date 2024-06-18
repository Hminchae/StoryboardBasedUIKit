//: [Previous](@previous)

import Foundation

let json = """
{
    "hello": "영등포캠퍼스 캠핑카",
    "my_name_is": null ,
    "thanky": null
}
"""

struct Product: Decodable {
    let product: String
    let price: Int
    let mall: String
    let sale: Bool
    
    //    var viewPrice: String {
    //        return price == nil ? "0원" : "\(price!)원"
    //    }
    
    enum CodingKeys: String, CodingKey {
        case product = "hello"
        case price = "my_name_is"
        case mall = "thanky"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.product = try container.decode(String.self, forKey: .product)
        // .decode는 옵셔널을 허용하지 않음
        self.price = try container.decodeIfPresent(Int.self, forKey: .price) ?? 0
        
        // ❤️ 신기해!!
        self.sale = price < 30000 ? true : false
        
        self.mall = try container.decodeIfPresent(String.self, forKey: .mall) ?? "네이버"
    }
}


guard let result = json.data(using: .utf8) else {
    fatalError("변환실패")
}

let decoder = JSONDecoder()

do {
    let value = try decoder.decode(Product.self, from: result)
    print(value)
} catch {
    print(error)
}

print(result)

//: [Next](@next)
