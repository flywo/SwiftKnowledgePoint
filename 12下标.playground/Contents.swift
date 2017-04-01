//: Playground - noun: a place where people can play

import UIKit

/*
 下标可以定义在类，结构体和枚举中
 */
//下标语法：允许通过在实例名称后面的括号中传入一个或者多个索引值来对实例进行存取。关键字subscript，指定一个或多个输入参数和返回类型。下标可以设定为读写或只读
class T {
    var x = 0
    subscript(index: Int) -> Int {
        get {
            return x
        }
        set {
            x = newValue
        }
    }
    //只读可以省略get关键字
//    subscript(index: Int) -> Int {
//        return 11
//    }
}
var t = T()
t.x = 10
t[10]

//dic类型的下标接收并返回可选类型的值，通过下标返回的是一个类型可选值

//下标选项：下标可以接收任意数量的入参，并且可以是任意类型的，返回值也可以是任意类型

//下标重载：一个类或结构体可以根据自身需要提供多个下标实现，使用下标时，将通过入参的数量和类型进行区分，自动匹配合适的下标
class Test {
    subscript(first: Int, second: Int) -> Int {
        return first * second
    }
}
let test = Test()
test[10, 10]
