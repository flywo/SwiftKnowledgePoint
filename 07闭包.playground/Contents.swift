//: Playground - noun: a place where people can play

import UIKit

/*
 闭包：自包含的函数代码块，可以在代码中被传递和使用
 闭包可以捕获和存储其所在上下文中任意常量和变量的引用，被称为包裹常量和变量
 形式：
    1.全局函数是一个有名字但不会捕获任何值的闭包
    2.嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
    3.闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量和常量值的匿名闭包
 swift的优化：
    1.利用上下文推断参数和返回值类型
    2.隐式返回单表达式闭包，即单表达式闭包可以省略return关键字
    3.参数名称缩写
    4.尾随闭包语法
 */
//闭包表达式
let names = ["a","c","e","o","b"];
//sorted(by:)接受一个闭包，闭包函数需要传入与数组元素类型相同的两个值，并返回一个布尔类型值来表明当排序结束后传入的第一个采纳数排在第二个参数前面还是后，前面为true，反之为false

//方式一：写一个符合类型要求的普通函数，作为参数传入
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 < s2
}
var news = names.sorted(by: backward)

//方式二：闭包表达式有一种形式：{(parameters) -> returnType in statements}
//闭包表达式参数可以是in-out参数，但不能设定默认值。也可以使用具名的可变参数，可变参数要放在参数列表最后一位。元组也可以作为参数和返回值。
news = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 < s2})
news
//内联闭包表达式中，函数和返回值类型都写在大括号内，而不是大括号外
//闭包函数体部分由关键字in引入，表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始

//根据上下文推断类型，由于swift推断参数和返回值的原因，所以返回箭头和围绕在参数周围的括号也可以被省略
news = names.sorted(by: {s1, s2 in return s1 < s2})

//单表达式闭包隐式返回，单行表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果
news = names.sorted(by: { s1, s2 in s1 < s2 })

//参数名称缩写，自动为内联闭包提供了参数名称缩写功能，可以直接通过$0,$1,$2来调用闭包的参数，使用了缩写，则可以省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断，这样in关键字也可以省略
news = names.sorted(by: { $0 < $1 })

//运算符方法，string类型定义了关于大于号>的字符串实现，其作为一个函数接受两个string类型的参数并返回bool类型的值因此可以这样写
news = names.sorted(by: <)

//尾随闭包，如果需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强可读性。尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。使用时，不用写出它的参数标签
func someFunc(closure: () -> Void) {}
//普通使用方式
someFunc(closure: {})
//使用尾随闭包
someFunc() {}

//所以上方排序可以如下改写
news = names.sorted() { $0 < $1 }

//如果闭包表达式是函数或方法的唯一参数，还可以省略掉（）
news = names.sorted { $0 < $1 }

//map
news = names.map { $0.uppercased() }
news

//值捕获，闭包可以在其被定义的上下文中捕获常量和变量，即使这些常量和变量作用于已经不存在，闭包仍然可以引用和修改
func step(setp: Int) -> () -> Int {
    var total = 0
    func add() -> Int {
        total += setp
        return total
    }
    return add
}
let f = step(setp: 5)
f()
f()
//如果一个值不会被闭包改变，或者在闭包创建后不会改变，swift会改为捕获并保存一份对值的拷贝

//闭包是引用类型，函数和闭包都是引用类型
let g = f
g()

//逃逸闭包，当一个闭包作为参数传入到一个函数中，但是这个闭包在函数返回之后才被执行。
//定义接受闭包作为参数的函数时，可以在参数名前标注@escaping，指明这个闭包是允许逃逸出这个函数的
var handlers: [() -> Void] = []
func someFunction(handler: @escaping () -> Void) {
    handlers.append(handler)//函数接受一个闭包作为参数，该闭包被添加到一个函数外定义的数组中，如果不将参数标记为逃逸闭包，会得到编译错误
}

//@escaping意味着必须在闭包中显示的引用self，非逃逸闭包，可以隐式引用self
func some1(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        some1 {
            self.x = 100
        }
    }
}
let so = SomeClass()
so.doSomething()
print(so.x)

//自动闭包，自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，被调用的时候，会返回被包装在其中的表达式的值。能够省略闭包的花括号，用普通表达式来代替显示的闭包
//自动闭包实现延时求值
var line = ["c","a","e","b"]
print(line.count)
let cus = { line.remove(at: 0) }
print(line.count)
cus()
print(line.count)
//尽管在闭包中的代码，已经被移除，但是在闭包调用之前，这个元素是不会被移除的

//可以将闭包作为参数传递给函数，同样能获得延时行为
func serve(custom: () -> String) {
    custom()
}
serve(custom: { line.remove(at: 0) })
line.count

//接收自动闭包
func server(custom: @autoclosure () -> String) {
    custom()
}
server(custom: line.remove(at: 0))
line.count

//让自动闭包可以逃逸
var providers: [() -> String] = []
func pro(custom: @autoclosure @escaping () -> String) {
    providers.append(custom)
}

