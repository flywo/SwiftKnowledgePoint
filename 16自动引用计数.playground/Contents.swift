//: Playground - noun: a place where people can play

import UIKit

//自动引用计数：ARC机制。只应用于类的实例，结构体和枚举类型是值类型，没有ARC

//将实例赋值给属性、常量或变量，都会创建此实例的强引用，只要引用还在，实例都不会被销毁的

//循环引用：两个实例互相持有对象的强引用，因此导致双方都一直存在，不会被销毁。

//解决实例之间的循环强引用：使用弱引用和无主引用
//弱引用：当其它实例有更短的声明周期，使用弱引用，也就是说其它实例析构在先。
//无主引用：其它实例有更长或者相同的声明周期。

//弱引用：声明属性或者变量时，在前面加上weak关键字表名这是一个弱引用，当实例被销毁后自动将其赋值为nil，所以会被定义为可选类型变量。
//ARC设置弱引用为nil时，属性观察器不会被触发
class A {
    var b: B?
}
class B {
    weak var a: A?
}

//无主引用：前面加上关键字unowned表示这是一个无主引用
//使用无主引用，必须确保引用始终指向一个未销毁的实例
class C {
    
}
class D {
    unowned let c: C
    init(C: C) {
        c = C
    }
}

//无主引用以及隐式解析可选属性
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

//闭包引用的循环引用：循环强引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了这个类实例时。这个闭包体中可能访问了实例的某个属性，例如self.someProperty，或者闭包中调用了实例的某个方法，例如self.someMethod()。这两种情况都导致了闭包“捕获”self，从而产生了循环强引用。

//解决闭包引起的循环强引用：在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。捕获列表定义了闭包体内捕获一个或者多个引用类型的规则。跟解决两个类实例间的循环强引用一样，声明每个捕获的引用为弱引用或无主引用，而不是强引用。应当根据代码关系来决定使用弱引用还是无主引用。

//闭包中使用self的成员，就是使用self.property,self.method

//定义捕获列表
//lazy var someClosure: Void -> String = {
//    [unowned self, weak delegate = self.delegate!] in
//    // 这里是闭包的函数体
//}

//闭包和捕获实例是同时销毁，定义无主引用
//引用可能为nil，定义为弱引用
//如果绝对不会为nil，应该用无主引用

//lazy var asHTML: Void -> String = {
//    [unowned self] in
//    if let text = self.text {
//        return "<\(self.name)>\(text)</\(self.name)>"
//    } else {
//        return "<\(self.name) />"
//    }
//}
