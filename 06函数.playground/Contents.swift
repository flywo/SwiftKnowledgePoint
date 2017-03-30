//: Playground - noun: a place where people can play

import UIKit

/************函数的定义与调用*************/
/*
 func:前缀
 ->:指定函数返回类型，->后跟着返回类型的名称
 ()：参数
 */
func greet(person: String) -> String {
    let g = "Hello,"+person+"!"
    return g
}
print(greet(person: "ABC"))

//无参数函数
func say() -> String {
    return "hello"
}
print(say())

//多参数函数+无返回值函数
//虽然没有定义返回类型，但函数会返回一个特殊的void值，实际上是一个空的元组，没有任何元素，可以写成()
func greet(person: String, age: Int) {
    print(person+":"+String(age))
}
greet(person: "aa", age: 12)

//忽略函数的返回值,返回值不会被使用，用_代替
_ = greet(person: "aaa")

//多重返回值函数，使用元组类型让多个值作为一个复合值从函数中返回
func minmax(array: [Int]) -> (begin: Int, last: Int) {
    return (array.first!, array.last!)
}
let bl = minmax(array: [1,2,3,4])
bl.begin//可以使用.语法来检索值
bl.last

//可选元组返回类型，如果返回的元组类型可能整个元组都没有值，可以使用可选元组返回类型，通过在元组类型右括号后反制一个问号来定义一个可选元组，例如(Int, Int)？
//(Int, Int)?与(Int?, Int?)是不同的，前者整个元组可选，后者元组每个元素可选
func minmax1(array: [Int]) -> (begin: Int, last: Int)? {
    if array.isEmpty { return nil }
    return (array.first!, array.last!)
}

//函数参数标签和参数名称
//参数标签：调用函数时使用，调用时需要将参数标签卸载对应参数前面
//参数名称：在函数的实现中使用，默认使用参数名称作为参数标签使用
//指定参数标签，在参数名称前指定参数标签，中间用空格分割
func some(name first: String) {
    print(first)
}
some(name: "aaa")

//忽略参数标签，如果不希望为某个参数添加标签，使用_替代
func someo(_ name: String) {
    print(name)
}
someo("hello")

//默认参数值，调用时可以忽略该参数
func peo(name: String, age: Int = 20) {
    print(name+":"+String(age))
}
peo(name: "angle")
peo(name: "angle", age: 33)

//可变参数，一个可变参数可以接收0个或者多个值，调用时，用可变参数来指定函数参数可以被传入不确定数量的输入值，在变量类型名后面加入(...)的方式来定义可变参数
//可变参数在函数中为此类型的一个数组，比如，叫numbers的doblue...可变参数，在函数内当做一个叫numbers的[doblue]型的数组常量
func ari(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers { total += number }
    return total
}
print(ari(1,2,3,4,5,6,7))
//一个函数只能拥有一个可变参数

//输入输出参数，函数参数默认是常量，如果想要一个函数可以修改参数的值，并且修改后依然存在，那么就需要把该参数定义为输入输出参数
//在参数定义前加上inout关键字，只能传递变量给输入输出参数。传入的参数作为输入输出参数时，需要在参数名前加上&符号，表示该值可以被函数修改
//输入输出参数不能有默认值，并且可变参数不能用inout标记
func change(_ a: inout Int, _ b: inout Int) {
    let c = a
    a = b
    b = c
}
var a = 10
var b = 11
change(&a, &b)
a
b

//函数类型，每个函数都有特定的函数类型，函数的类型由函数的参数类型和返回类型组成
func add(_ a: Int, _ b: Int) -> Int { return a + b }
//函数类型为：(Int, Int) -> Int

func prit() {}
//函数类型为：() -> Void

//使用函数类型就跟使用其它类型一样，可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它
var addm: (Int, Int) -> Int = add
print(addm(1, 4))

//相同匹配类型的不同函数可以被赋值给同一个变量
func del(_ a: Int, _ b: Int) -> Int { return a - b }
addm = del
print(addm(4, 1))

//可以让swift推断函数类型，直接赋值
let fun = del
fun(3, 1)

//函数类型作为参数类型，可以把(Int, Int) -> Int这样的函数类型作为另一个函数的参数类型，这样可以将函数的一部分实现留给函数的调用者来提供
func fun(_ fun: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print(fun(a, b))
}
fun(del, 4, 23)

//函数类型作为返回类型，在返回箭头后写一个完整的函数类型
func up(_ a: Int) -> Int { return a + 1 }
func down(_ a: Int) -> Int { return a - 1 }
func fun(isUp: Bool) -> (Int) -> Int {
    return isUp ? up : down
}
var f = fun(isUp: true)
f(12)
f = fun(isUp: false)
f(12)

//嵌套函数，可以把函数定义在别的函数体重，称为嵌套函数
func choice(_ up: Bool) -> (Int) -> Int {
    func ups(_ a: Int) -> Int { return a + 1 }
    func downs(_ a: Int) -> Int { return a - 1 }
    return up ? ups : downs
}
f = choice(true)
f(12)
f = choice(false)
f(12)
