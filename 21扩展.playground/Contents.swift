//: Playground - noun: a place where people can play

import UIKit

//扩展：为一个已有的类，结构体，枚举或者协议添加新的功能。包括给没有权限获取原始源代码情况下扩展能力。与OC中的分类类似。
/*
 swift可以扩展的有：
 1.添加计算型属性和计算型类型属性
 2.定义实例方法和类型方法
 3.提供新的构造器
 4.定义下标
 5.定义和使用新的嵌套类型
 6.使一个已有类型符合某个协议
 甚至可以对协议进行扩展，提供协议要求的实现，或者添加额外功能，从而可以让符合协议的类型拥有这些功能。
 ！！！！扩展可以为一个类型添加新的功能，但是不能重写已有的功能。
 */

//扩展语法：使用关键字extension声明扩展
//extension Some {
//    添加新功能
//}

//扩展已有类型，使其采纳一个或多个协议
//extension Some: Protocol, Protocol1 {
//    协议实现
//}

//!!!!如果通过扩展为一个已有类型添加新功能，那么新功能对该类型的所有实例都是可用的，即使他们是在这个扩展定义之前创建的。

//计算型属性：为已有类型添加计算型实例属性和计算型类型属性。
extension Double {
    var km: Double {return self*1_000.0}
}
let one = 23.4.km
//!!!!扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器

//构造器：可以为已有类型添加新的构造器，从而扩展其它类型，将子句的定制类型作为构造器参数。扩展能够添加的是便利构造器，不能为类添加新的指定构造器或析构器。指定构造器和析构器必须总是有原始类实现来提供。
//！！！！如果你使用扩展为一个值类型添加构造器，同时该值类型的原始实现中未定义任何定制的构造器且所有存储属性提供了默认值，那么我们就可以在扩展中的构造器里调用默认构造器和逐一成员构造器。如果把定制的构造器卸载值类型的原始实现中，上述规则不再适用。
struct Point {
    var x = 0
    var y = 0//提供了默认值，会有一个默认构造器。没有提供构造器，会有一个逐一成员构造器
}
extension Point {
    init(xxxx: Int, yyyy: Int) {
        self.init(x: xxxx, y: yyyy)
    }
}
let point = Point(xxxx: 10, yyyy: 10)
//!!!!扩展提供构造器，需要确保构造过程能够让实例完全初始化

//方法：扩展已有类型，添加新的实例方法和类型方法
extension Int {
    func repetitions(task: () -> Void) {//接受一个()->Void类型的单参数
        for _ in 0..<self {
            task()
        }
    }
}
//普通调用
4.repetitions(task: {print("哈罗")})
//尾随闭包
4.repetitions {print("你好")}

//可变实例方法：通过扩展添加的实例方法也可以修改实现本身，结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating，和原始实现的可变方法一样
extension Int {
    mutating func square() {
        self = self*self
    }
}
var some = 7
some.square()

//下标：扩展可以为已有类型添加新的下标
extension Int {
    subscript(index: Int) -> Int {//返回十进制数从右向左第n个数字
        var base = 1
        for _ in 0..<index {
            base *= 10
        }
        return (self/base)%10
    }
}
123456789[5]

//嵌套类型：可以为已有的类，结构体和枚举添加新的嵌套类型
extension Int {
    enum Kind {
        case N,Z,P
    }
}
