//: [Previous](@previous)

import Foundation

var nickname = "thanky"

var originalName = nickname

print(nickname, originalName)

originalName = "감자도리"

print(nickname, originalName)

struct UserStruct {
    var name: String
    let age: Int
}

let jack = UserStruct(name: "jack", age: 15)
var hue = jack

print(jack.name, hue.name)

hue.name = "hue"

print(jack.name, hue.name)

class UserClass {
    var name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let bran = UserClass(name: "bran", age: 10)

let den = bran

print(bran.name, den.name)

den.name = "den"

print(bran.name, den.name)


//: [Next](@next)



