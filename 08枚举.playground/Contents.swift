//: Playground - noun: a place where people can play

import UIKit


/*
 枚举：一组相关的值定义了一个共同的类型，可以在代码中以安全的方式使用这些值
 枚举成员可以指定任意类型的关联值存储到枚举成员中。
 */
//枚举语法，enum关键字创建枚举，并且整个定义放在一对大括号内
enum ComPoint {
    case north
    case south
    case east
    case west
}//枚举成员创建时不会被赋予一个默认的整型值，枚举成员本身就是完备的值

//多成员在同一行，用逗号分开
enum Pa { case mer, venus, eatrh, mars }

//使用
var dir = ComPoint.west

//dir已经被推断出来类型，则，可以简写
dir = .north

//switch语句匹配枚举值
switch dir {
case .north:
    print("成功")
default:
    print("失败")
}
//switch必须穷举所有情况，如果有忽略的，用default，否则就需要全部穷举

//关联值，可以为成员设置一个常量和变量，并在之后查看。关联值可以是任意类型
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrcode(String)
}
//创建
var pro1 = Barcode.upc(4, 33, 33, 4)
//pro1变量，将barcode.upc赋值给它，关联的元组值

//已知类型
pro1 = .qrcode("aaa")

//pro1变量是barcode类型的，可以存储一个.upc或者一个.qrcode

//使用switch语句检查不同类型。关联值可以被提取出来作为switch语句的一部分，在case分支中提取每个关联值作为常量或者变量来使用
switch pro1 {
case .upc(let a, let b, let c, let d):
    print(a,b,c,d)
case .qrcode(let a):
    print(a)
}

//如果所有成员的关联值都被提取，可以使用简洁的方法

switch pro1 {
case let .upc(a,b,c,d):
    print(a,b,c,d)
case let .qrcode(a):
    print(a)
}

//原始值，枚举成员可以被默认值填充，原始值的类型必须相同
enum ASCII: Character {//枚举类型的原始值被定义为character，并设置了场景的字符串
    case tab = "\t"
    case line = "\n"
    case retur = "\r"
}
//原始值可以是字符串，字符，或者任意整型值或者浮点数，但是每个原始值在枚举声明中必须是唯一的

//原始值和关联值是不同的，原始值是在定义枚举时被预先填充的值，原始值始终不变
//关联值是创建一个机遇枚举成员的常量或变量时才设置的值，枚举成员的关联至可以变化

//原始值隐式赋值，使用原始值为整数或者字符串类型的枚举时，swift会自动的赋值
enum Plant: Int {
    case mer = 1, ven, ear, mar, jup
}
//mer=1,ven=2...

//使用字符串作为原始值时，原始值默认为枚举成员的名称
enum com: String {
    case nor, our, east
}

//使用枚举成员的rawvalue属性可以访问该枚举成员的原始值
Plant.ven.rawValue
Plant.jup.rawValue
com.nor.rawValue

//使用原始值初始化枚举,使用初始化方法来创建新的枚举实例
let poss = Plant(rawValue: 1)//利用1创建了枚举成员mer

//如果原始值不存在，则会返回nil
let pos = Plant(rawValue: 12)

//递归枚举，是一种枚举类型，有一个或多个枚举成员使用该枚举类型的实例作为关联值
enum Ari {
    case number(Int)
    //indirect表示该成员可递归
    indirect case add(Ari, Ari)
    indirect case mul(Ari, Ari)
}

//或者在枚举类型前加上indirect，表明所有成员都是可递归的
indirect enum ari {
    case number(Int)
    case add(ari, ari)
    case mul(ari, ari)
}

//使用
let one = ari.number(5)
let two = ari.number(6)
let sum = ari.add(one, two)
let prod = ari.mul(one, two)

//操作递归性质的数据结构，使用递归函数
func eva(_ exp: ari) -> Int {
    switch exp {
    case let .number(value):
        return value
    case let .add(left, right):
        return eva(left) + eva(right)
    case let .mul(left, right):
        return eva(left) * eva(right)
    }
}
eva(prod)
