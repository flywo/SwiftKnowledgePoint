//: Playground - noun: a place where people can play

import UIKit

//swift允许定义嵌套类型，可以在支持的类型中定义嵌套的枚举、类和结构体
struct A {
    enum B: Character {
        case S = "1", B = "2"
    }
}//结构体A中嵌套了枚举B

//引用嵌套类型：在外部引用嵌套类型时，在嵌套类型的类型名前加上其外部类型的类型名作为前缀。
let S = A.B.S.rawValue

