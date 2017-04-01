//: Playground - noun: a place where people can play

import UIKit

//属性将值跟特定的类，结构或枚举关联。存储属性存储常量或变量作为实例的一部分，而计算属性计算一个值。计算属性可以用于类型，结构体和枚举，存储属性智能用于类和结构体
//直接作用于类型本身的属性，称为类型属性
//还可以定义属性观察器来监控属性值的变化，以此来触发一个自定义的操作。属性观察器可以添加到自定义的存储属性上，也可以添加父类的继承的属性上

//存储属性，存储在特定类或结构体实例的一个常量或变量，可以是变量也可以是常量。
//定义时可以指定默认值，也可以在构造过程中设置或修改存储属性的值
struct Fix {
    var first: Int
    let lenght: Int
}
var fix = Fix(first: 1, lenght: 10)
fix.first

//常量结构体的存储属性，如果创建了一个常量结构体，则无法修改该实例任何属性，即使属性是变量也不行
//结构体是值类型，当被声明为常量后，所有属性就成了常量。引用类型则不会

//延迟存储属性，第一次调用时才会计算其初始值的属性，在属性前使用lazy来标示一个属性为延迟属性
//延迟属性必须声明为变量
class DataI {
    var fileName = "data.txt"
}
class DataM {
    lazy var importer = DataI()
    var data = [String]()
}
//被标记为lazy的属性在没有初始化时就被多个线程访问，则无法保证该属性只会被初始化一次

//计算属性，类，结构体，枚举都可以定义计算属性，计算属性不直接存储值，而是提供一个getter和一个可选的setter来简介获取和设置其他属性或变量的值
struct Point {
    var x = 0, y = 9
}
struct Size {
    var width = 0, height = 9
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let x = origin.x + size.width/2
            let y = origin.y + size.height/2
            return Point(x: x, y: y)
        }
        set(new) {
            origin.x = new.x
            origin.y = new.y
        }
    }
}

//如果计算属性的set方法没有定义新的值参数名，可以使用默认名称，newValue
/*
 set {
 ....
 }
 */

//计算属性必须用var关键字，只读计算属性可以去掉get关键字和花括号
struct Cub {
    var vol: Double {
        return 10
    }
}

//属性观察器，每次属性被设置时，都会调用
//可以为除了延迟属性之外的其它存储属性添加属性观察器
//也可以通过重写属性的方式为继承的属性添加属性观察器
//非重写的计算属性不必添加属性观察器，通过setter直接监控

//willset:新值被设置之前调用,新的属性值当做常量传入，默认newvalue表示
//didset:新值被设置之后调用，将旧值作为参数传入，默认oldValue

//父类的属性在子类的构造器中被赋值时，父类的观察器先被调用，随后才调用子类的观察器。父类初始化方法调用之前，子类给属性赋值，观察器不会被调用
class Step {
    var total: Int = 0 {
        willSet {
            print("新值：\(newValue)")
        }
        didSet {
            print("旧值：\(oldValue)")
        }
    }
}
let se = Step()
se.total = 10

//如果属性是in-out方式传入，也会调用。

//全局变量和局部变量，计算属性和属性观察器的功能可以用于全局变量和局部变量

//类型属性，类属性可以变量和常量

/*
 与实例变量不同：必须给类属性指定默认值，类本身没有构造器，也无法在初始化过程中使用构造器给类属性赋值
 类属性是延迟初始化的，只有在第一次被访问时才会被初始化，即使被多个线程访问，系统也能保证只初始化一次
 */
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

//获取和设置类型属性的值，通过.运算符来访问
SomeClass.storedTypeProperty
