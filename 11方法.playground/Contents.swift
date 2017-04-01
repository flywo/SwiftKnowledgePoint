//: Playground - noun: a place where people can play

import UIKit

/*
 方法：某些特定类型相关联的函数。类，结构体，枚举都可以定义实例方法。也可以定义类型方法
 */
//实例方法：某个特定类、结构体或者枚举类型实例的方法。
//实例方法能够隐式访问它所属类型的所有的其它实例方法和属性。
class Counter {
    var count = 0
    func inc() {
        count += 1
    }
    func inc(by amount: Int) {
        count += amount
    }
    func res() {
        count = 0
    }
}

//使用.语法调用方法
let counter = Counter()
counter.inc(by: 5)
counter.count

//self属性：每个实例都有一个隐含的属性self，等同于该实例本身
//但实际上，代码里不用经常写self，当实例方法参数和属性名称相同时，可以用self区分
struct Point {
    var x = 0.0
    mutating func change(x: Double) {
        self.x = x
    }
}

//在实例方法中修改值类型：结构体和枚举是值类型，默认情况下，值类型的属性不能再实例方法中被修改的。如果需要在某个方法中修改结构体或者枚举的属性，需要为这个方法选择可先mutating行为，然后就可以从方法内部改变它的属性，并且做的任何修改都会在方法执行结束时写回到原始结构中。

//不能再结构体类型的常量上调用可变方法，因为属性不能被改变，即使属性是变量属性
let p = Point()
//p.change(x: 10)//会报错

//在可变方法中给self赋值：可变方法能够赋给隐含属性self一个全新的实例
struct Poin {
    var x = 0.0, y = 0.0
    mutating func move(x: Double, y: Double) {
        self = Poin(x: x, y: y)
    }
}

//枚举的可变方法可以把self设置为同一枚举类型中不同的成员
enum Tr {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var or = Tr.low
or.next()
or.next()

//类型方法：定义在类型本身上调用的方法，在func前加上static关键字。类还可以用关键字class来允许子类重写父类的实现方法
//可以为类，结构体，枚举定义类型方法，每一个类型方法都被它所支持的类型显示包含
class SomeClass {
    class func someType() {
        print("执行")
    }
}
SomeClass.someType()

//类型方法中，self指向类型本身，而不是某个实例

//@discardableResult：调用时忽略返回值，不产生警告
class Test {
    @discardableResult
    static func result() -> Int {
        return 10
    }
}
Test.result()
