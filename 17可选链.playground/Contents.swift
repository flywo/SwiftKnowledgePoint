//: Playground - noun: a place where people can play

import UIKit

//可选链式调用是一种可以在当前值可能为nil的可选值上请求和调用属性、方法及下标的方法。如果可选值有值，那么调用就会成功；如果可选值是nil，那么调用将返回nil。多个调用可以连接在一起形成一个调用链，如果其中任何一个节点为nil，整个调用链都会失败，即返回nil。

//使用可选链式调用代替强制展开：
class Person {
    var residence: Residence?
}
class Residence {
    var number = 1
}
let j = Person()
if let r = j.residence?.number {
    print("值")
}else {
    print("无")
}

//为可选链式调用定义模型类：

//通过可选链式调用访问属性：

//通过可选链式调用调用方法：

//通过可选链式调用访问下标：

//通过可选链式调用访问可选值的下标时，应该将问号放在下标方括号的前面而不是后面。可选链式调用的问号一般直接跟在可选表达式的后面。

//访问可选类型的下标：

//连接多层可选链式调用：
//通过可选链式调用访问一个Int值，将会返回Int?，无论使用了多少层可选链式调用。
//类似的，通过可选链式调用访问Int?值，依旧会返回Int?值，并不会返回Int??。

//在方法的可选返回值上进行可选链式调用：
