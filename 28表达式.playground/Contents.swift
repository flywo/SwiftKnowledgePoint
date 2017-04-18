//: Playground - noun: a place where people can play

import UIKit

//前缀表达式：由前缀运算符和表达式组成，前缀运算符只接收一个参数，表达式则紧随其后
//对某个变量使用&运算符，将其传递给函数的输入输出参数

//try运算符：
//sum = try someThrowingFunction() + anotherThrowingFunction()   // try 对两个函数调用都产生作用
//sum = try (someThrowingFunction() + anotherThrowingFunction()) // try 对两个函数调用都产生作用
//sum = (try someThrowingFunction()) + anotherThrowingFunction() // 错误：try 只对第一个函数调用产生作用

//闭包表达式：闭包表达式会创建一个闭包，在其他语言中也叫 lambda 或匿名函数。跟函数一样，闭包包含了待执行的代码，不同的是闭包还会捕获所在环境中的常量和变量。它的形式如下：
//{ (parameters) -> return type in
//    statements
//}
//myFunction {
//    (x: Int, y: Int) -> Int in
//    return x + y
//}
//
//myFunction {
//    (x, y) in
//    return x + y
//}
//
//myFunction { return $0 + $1 }
//
//myFunction { $0 + $1 }//都是等价的

//捕获列表：闭包会捕获附近作用域中的常量和变量，并使用强引用指向它们。你可以通过一个捕获列表来显式指定它的捕获行为。
//捕获列表在参数列表之前，由中括号括起来，里面是由逗号分隔的一系列表达式。一旦使用了捕获列表，就必须使用 in 关键字，即使省略了参数名、参数类型和返回类型。
//捕获列表中的项会在闭包创建时被初始化。每一项都会用闭包附近作用域中的同名常量或者变量的值初始化。例如下面的代码示例中，捕获列表包含 a 而不包含 b，这将导致这两个变量具有不同的行为。
var a = 0
var b = 0
let closure = { [a] in
    print(a, b)
}
a = 10
b = 10
closure()
// 打印 “0 10”
//在示例中，变量 b 只有一个，然而，变量 a 有两个，一个在闭包外，一个在闭包内。闭包内的变量 a 会在闭包创建时用闭包外的变量 a 的值来初始化，除此之外它们并无其他联系。这意味着在闭包创建后，改变某个 a 的值都不会对另一个 a 的值造成任何影响。与此相反，闭包内外都是同一个变量 b，因此在闭包外改变其值，闭包内的值也会受影响。

//如果闭包捕获的值具有引用语义则有所不同。例如，下面示例中，有两个变量 x，一个在闭包外，一个在闭包内，由于它们的值是引用语义，虽然这是两个不同的变量，它们却都引用着同一实例。
class SimpleClass {
    var value: Int = 0
}
var x = SimpleClass()
var y = SimpleClass()
let closur = { [x] in
    print(x.value, y.value)
}
x.value = 10
y.value = 10
closur()
// 打印 “10 10”

//如果捕获列表中的值是类类型，你可以使用 weak 或者 unowned 来修饰它，闭包会分别用弱引用和无主引用来捕获该值。
/*
 myFunction { print(self.title) }                   // 以强引用捕获
 myFunction { [weak self] in print(self!.title) }   // 以弱引用捕获
 myFunction { [unowned self] in print(self.title) } // 以无主引用捕获
 */

//在捕获列表中，也可以将任意表达式的值绑定到一个常量上。该表达式会在闭包被创建时进行求值，闭包会按照指定的引用类型来捕获表达式的值。例如：
// 以弱引用捕获 self.parent 并赋值给 parent
//myFunction { [weak parent = self.parent] in print(parent!.title) }

//若类型可被推断出来，可以使用隐式成员表达式来访问某个类型的成员（例如某个枚举成员或某个类型方法），形式如下：.成员名称

//通配符表达式可以在赋值过程中显式忽略某个值。例如下面的代码中，10 被赋值给 x，而 20 则被忽略：

//(x, _) = (10, 20)
// x 为 10，20 被忽略

//选择器表达式可以让你通过选择器来引用在Objective-C中方法(method)和属性(property)的setter和getter方法。#selector(方法名) #selector(getter: 属性名) #selector(setter: 属性名)

//后缀 self 表达式由某个表达式或类型名紧跟 .self 组成，其形式如下：
//表达式.self，返回表达式的值：x.self返回x
//类型.self，返回相应类型，可用来获取某个实例的类型作为一个值来使用。SomeClass.self返回SomeClass类型本身，可以传递给函数或者方法作为参数

//dynamicType 表达式由类似函数调用表达式(Function Call Expression)的特殊语法表达式组成,形式如下:type(of:表达式)
//上述形式中的表达式不能是类型名。type(of:) 表达式会返回某个实例在运行时的类型，具体请看下面的例子：

class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}
class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}
let someInstance: SomeBaseClass = SomeSubClass()
// someInstance 在编译时的静态类型为 SomeBaseClass，
// 在运行时的动态类型为 SomeSubClass
type(of: someInstance).printClassName()
// 打印 “SomeSubClass”