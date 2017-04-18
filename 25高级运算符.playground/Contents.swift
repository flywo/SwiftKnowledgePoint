//: Playground - noun: a place where people can play

import UIKit

//位运算符
//~按位取反
// 01
// 10 结果

//&按位与
// 1100
// 0110
// 0100 结果

//|按位或
// 1010
// 0110
// 1110

//^按位异或
// 0101
// 0011
// 0110

//<<按位左移 >>按位右移
//左移*2 右移/2

//&+溢出假发  &-溢出剪发 &*溢出乘法

//类和结构体可以为现有的运算符提供自定义的实现，称为运算符重载
struct V {
    var x=0,y=0
}
extension V {
    static func + (l: V, r: V) -> V {
        return V(x: l.x+l.y, y: r.x+r.y)
    }
}
let vector = V(x: 3, y: 1)
let another = V(x: 10, y: 11)
let c = vector + another
c.y
c.x

//实现前缀或后缀运算符，需要在func关键字前指定prefix或者postfix
extension V {
    static prefix func - (v: V) -> V {
        return V(x: -v.x, y: -v.y)
    }
}

//复合赋值运算符，需要在运算符左参数设置成inout
extension V {
    static func += (l: inout V, r: V) {
        l = l + r
    }
}

//等价运算符 ==, !=
extension V {
    static func == (l: V, r: V) -> Bool {
        return (l.x == r.x) && (l.y == r.y)
    }
}

//自定义运算符，新的运算符要使用operator关键字在全局作用于进行定义，还要指定prefix,infix,postfix
prefix operator +++
extension V {
    static prefix func +++ (V: inout V) -> V {
        return V
    }
}



