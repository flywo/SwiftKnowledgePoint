//: Playground - noun: a place where people can play

import UIKit

//定义基类：swift中的类并不是从一个通用的基类继承而来，如果不指定超类的话，该类自动成为基类。
class Veh {
    var cur = 0
    var description: String {
        return "\(cur)值"
    }
    func makeNoise() {
    }
}
let some = Veh()
print(some.description)

//子类生成
class stud: Veh {
    var has = false
}
let stu = stud()
print(stu.description)

//重写，需要在定义前面加上override，表名提供重写版本

//访问超类方法，属性，下标：使用super来访问超类版本的方法，属性或下标

//重写方法
class Stud: Veh {
    override func makeNoise() {
        print("很吵")
    }
}

//重写属性
//重写getters和setters
//可以将只读属性重写为一个读写属性，不能将读写属性重写为只读属性
//重写提供了setter那么也提供了getter，如果不想在getter修改继承来的属性，可以通过super.someproperty来返回继承来的值
class Car: Veh {
    override var description: String {
        return "重写了"
    }
}
let car = Car()
print(car.description)

//重写属性观察器
//不可以为继承来的常量或只读计算属性添加观察器
//不可以同时提供重写的setter和重写的属性观察器。如果那个属性提供了定制的setter，那么在setter中就可以观察了
class Carr: Veh {
    override var cur: Int {
        didSet {
            print("值被改变了！\(oldValue)")
        }
    }
}
let ca = Carr()
ca.cur = 10

//防止重写：方法，属性或下标标记为final防止重写
//在关键字class前添加final，整个类都不可以被继承

