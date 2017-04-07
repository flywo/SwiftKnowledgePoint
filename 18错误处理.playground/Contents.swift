//: Playground - noun: a place where people can play

import UIKit

//表示并抛出错误：错误用符合Error协议的类型的值来表示，枚举适合构建一组相关的错误状态，还可以提供额外的信息
enum Vend: Error {
    case invalid
    case insuffic(conisNeed: Int)
    case out
}

//抛出错误使用throw关键字
throw Vend.insuffic(conisNeed: 4)

//错误处理：错误被抛出时，附近的某部分代码必须处理这个错误。swift有4中处理错误的方式：函数抛出错误传递给调用此函数的代码、用do-catch语句处理错误、将错误作为可选类型处理、断言此错误根本不会发生
//为了标识会抛出错误的地方，在调用一个能抛出错误的函数、方法或构造器之前，加上try关键字，或者try?和try!

//用throwing函数传递错误：为了标识一个函数、方法构造器可以抛出错误，在函数声明的参数列表之后加上throws关键字。如果函数指明返回值类型，throws关键字需要卸载箭头的前面
//func canThrowErrors() throws -> String

//一个throwing函数可以在其内部抛出错误，并将错误传递到函数被调用时的作用域。只有throwing函数可以传递错误，任何非throwing函数内部抛出的错误智能在函数内部处理
struct Item {
    var price: Int
    var count: Int
}
class Vending {
    var inv = [
        "a": Item(price: 12, count: 12)
    ]
    var con = 0
    func find(name: String) throws {
        guard let _ = inv[name] else {
            throw Vend.out
        }
        print("没有抛出！")
    }
}
//在调用方法时，必须要直接处理这些错误，使用do-catch语句，或者try?或try!，如果调用函数同样是一个throwing函数，则错误会一直被传递到该函数被调用的地方
func buy(vend: Vending, name: String) throws {
    try vend.find(name: name)//会将错误继续往上传递
}

//throwing构造器，能够像throwing函数一样传递错误，错误会传递到他的调用者来处理这些错误
struct Pur {
    init(name: String, vend: Vending) throws {
        try vend.find(name: name)
    }
}

//用do-catch处理错误：使用do-catch语句运行一段闭包代码来处理错误，如果在do子句中抛出一个错误，这个错误会与catch子句做匹配，决定哪条子句能够处理
//do {
//    try expression
//} catch pattern 1 {
//} catch pattern 2 where condition {
//}

//catch后面写一个匹配模式来表明这个子句能够处理什么样的错误。如果一条catch子句没有指定匹配模式，那么这条子句可以匹配任何错误，并且把错误绑定到一个名字为error的局部常量
//catch子句不必将do子句中的代码抛出的每一个可能的错误都做处理。
var vend = Vending()
vend.con = 8
do {
    try buy(vend: vend, name: "a")
    //如果没有抛出错误，则会执行后面的语句
} catch Vend.invalid {
    print("1")
} catch Vend.out {
    print("2")
} catch Vend.insuffic(let coin) {
    print(coin)
}

//将错误转换成可选值：可以使用try?通过将错误转换成一个可选值来处理错误。如果抛出一个错误，那么表达式的值就是nil
//let x = try? some()
//等同于：
//let y: Int?
//do {
//    y = try some()
//} catch {
//    y = nil
//}

//func fetchDataFromDisk() throws -> Data {
//}
//
//func fetchData() -> Data? {
//    if let data = try? fetchDataFromDisk() { return data }
//    return nil
//}

//禁用错误传递：有时候知道throwing函数实际上不会抛出错误，可以使用try!来禁用错误传递。这回把调用包装在一个不会有错误抛出的运行时段严重。如果真的抛出错误，则会得到一个错误。

//指定清理操作：可以使用defer语句再即将离开当前代码块时执行一系列语句，无论是以何种方式离开当前代码块----抛出错误离开，还是return或者break的语句。
//defer语句将代码的执行延迟到当前的作用域退出之前，第一条defer语句中的代码会在第二条defer语句中的代码执行之后才执行。
//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readline() {
//            // 处理文件。
//        }
//        // close(file) 会在这里被调用，即作用域的最后。
//    }
//}

//即使没有涉及到错误处理，也可以使用defer语句
