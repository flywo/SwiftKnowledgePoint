//: Playground - noun: a place where people can play

import UIKit

//协议：定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法、属性以及其他需要的东西。类、结构体、枚举都可以遵循协议，并未协议定义的这些要求提供具体实现。
//可以对协议进行扩展，实现一部分要求或者附加功能。

//语法
//protocol Some {
//    协议的定义部分
//}

//遵守协议，类型名称后加上协议，以：分割。如果有父类的，父类写在协议前面
//struct Some: Protocol, Protocol1 {
//    定义部分
//}

//属性要求：可以要求遵循的类型提供特定名称的类型和实例属性或类型属性。协议不指定属性是存储属性还是计算属性，只指定属性的名称和类型，此外，协议还指定属性是可读的还是可读可写的。

//如果是可读可写的，那么属性不能使常量属性或只读的计算属性。如果只要求是可读的，那么该属性不仅可以是可读的，还可以是可写的。

//协议用var声明变量，声明后加上{set get}表示可读可写，可读用{get}
protocol Some {
    var must: Int {get set}
    var may: Int {get}
    static var some: Int {get set}
}
//定义类型属性时，使用static为前缀。当类类型遵循协议时，出了static，还可以使用class
struct Person: Some {
    var must: Int = 0
    var may: Int = 0
    static var some: Int = 0
}
let p = Person()

//方法要求：可以要求遵循协议的类型实现某些特定的实例方法或类方法。可定义可变参数，不支持默认参数。定义类方法时，使用static，当类类型遵循协议时，出了static还可以使用class
protocol SomeP {
    func some1()
    static func someMethod()
}

//mutating方法要求：需要在方法中改变所属实例时，使用mutating做前缀
//!!!!实现协议中的mutating方法时，如果是类类型，则不用写mutating关键字，结构体和枚举，则必须写mutating关键字

//构造器要求：可以要求遵循协议的类型实现指定的构造器
protocol S {
    init(some: Int)
}

//构造器要求在类中的实现：可以在遵循协议的类中实现构造器，无论是指定构造器还是便利构造器，都必须加上required修饰符
class SomeClass: S {
    required init(some: Int) {//required确保所有子类必须提供该构造器
    }
}
//如果子类重写父类，并满足协议要求，那么必须同时标注required和override
protocol P1 {
    init()
}
class C1 {
    init() {
    }
}
class C2: C1, P1 {
    required override init() {
    }
}

//可失败构造器要求：协议还可以为遵循协议的类型定义可失败构造器要求

//协议作为类型：尽管协议本身未实现任何功能，但是协议可以当做一个成熟的类型来使用
/*
 使用场景：
 1.作为函数，方法或构造器中的参数类型或返回值类型
 2.作为常量、变量或属性的类型
 3.作为数组、字典或其他容器中的元素类型
 */
//!!!!协议是一种类型，因此协议类型的名称应与其他类型写法相同
class D {
    let gen: P1//gen属性为协议P1，表示遵循了P1协议的类型实例都可以赋值给gen
    init(gen: P1) {
        self.gen = gen
    }
}

//委托：允许类或结构体将一些需要他们负责的任务委托给其他类型的实例。
protocol Delegate {
    func say()
}
class PersonA {
    var delegate: Delegate?
    func play() {
        delegate?.say()
    }
}
class PersonB: Delegate {
    func say() {
        print("我是A的代理B，我替他说！")
    }
}
let p1 = PersonA()
let p2 = PersonB()
p1.delegate = p2
p1.play()

//通过扩展添加协议一致性：即使无法修改源码，可以通过扩展为类型遵循并符合协议。
//!!!!通过扩展遵循协议时，该类型的所有实例也会随之获得协议中定义的各项功能
protocol Text {
    var text: String {get}
}
extension Int: Text {
    var text: String {
        return String(self)
    }
}
77.text

//协议类型的集合：协议类型可以在数组或者字典这样的集合中使用
let thins: [Text] = [44,55,66]

//协议的继承：协议能够继承一个或多个其它协议
protocol SubText: Text {
}

//类类型专属协议：通过class关键字来限制智能被类类型遵循，class关键字必须第一个出现在协议的继承列表中，在其它协议被继承之前
protocol SubSubText: class, SubText {
}

//协议合成：需要同时遵循多个协议，可以将多个协议采用one&tew的格式组合。
protocol Name {
    var name: String {get}
}
protocol Age {
    var age: String {get}
}
struct Per: Name,Age {
    var name: String
    var age: String
}
func wish(to cele: Name & Age) {
    print("哈罗",cele.name,cele.age)
}
wish(to: Per(name: "12", age: "18"))

//检查协议一致性：使用is和as来检查协议一致性，即是否符合某些一，并且可以转换到指定的协议类型
/*
 is检查实例是否符合某个协议
 as?返回一个可选值，当实例符合某个协议时，返回可选值
 as!强制转换到某个协议类型
 */
protocol HasArea {}
class Circle: HasArea {}
let c = Circle()
c is HasArea
c as? HasArea
c as HasArea
c as! HasArea

//可选协议要求：协议可以定义可选要求，遵循协议的类型可以选择是否实现这些要求。optional表名可选，使用了，协议和可选要求都必须带上@objc，标记@objc特性的协议只能被继承自OC类的类或者@objc类遵循，其它类和结构体枚举均不能遵循该协议

//使用可选要求时，类型会自动变成可选的，比如(int)->string方法会变成((int)->string)?。表示整个函数类型是可选的，而不是函数的返回值

//协议中的可选要求可以通过链式调用来使用，在可选方法名称后面加上？来调用可选方法
@objc protocol Count {
    @objc optional static var num: Int {get}
    @objc optional func incre(conut: Int) -> Int
}
class Counter: Count {
}
let count = Counter()

//协议扩展：通过扩展为遵循协议的类型提供属性、方法以及下标的实现。可以基于协议本身来实现这些功能，而无序在每个类型中都做同样得实现
extension Count {
    func say() {
        print("你好")
    }
}
count.say()

//提供默认实现：可以通过协议扩展来为协议要求的属性、方法以及下标提供默认的实现。如果遵循协议的类型为这些要求提供自己的实现，则自定义实现将替代扩展中的实现。
extension Count {
    func incre(count: Int) -> Int {
        return 1000
    }
}
class PPPP: Count {}
let pp = PPPP()
pp.incre(count: 11)

//为协议扩展添加限制条件：扩展协议时，可以指定一些现实条件，只有遵循协议的类型满足这些条件时，才能获得协议扩展提供的默认实现。限制条件协议协议名之后，使用where子句描述
//extension Count where  {}
