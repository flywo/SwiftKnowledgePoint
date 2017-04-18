//: Playground - noun: a place where people can play

import UIKit

//类型注释：显示的指定一个变量或表达式的值，开始于冒号：终于类型
let some: (Double, Double) = (3.1, 3.3)
func someFun(a: Int) {}

//类型标识符
typealias Point = (Int, Int)
let origin: Point = (0, 0)

//var someValue: Ex.MyType

//元组类型：使用括号括起来的零个或多个类型，类型间用逗号隔开。

/*
 var someTuple = (top: 10, bottom: 12)  // someTuple 的类型为 (top: Int, bottom: Int)
 someTuple = (top: 4, bottom: 42) // 正确：命名类型匹配
 someTuple = (9, 99)              // 正确：命名类型被自动推断
 someTuple = (left: 5, right: 5)  // 错误：命名类型不匹配
 */

//函数类型：表示一个函数、方法或闭包的类型，它由参数类型和返回值类型组成，中间用箭头（->）隔开

/*
 func someFunction(left: Int, right: Int) {}
 func anotherFunction(left: Int, right: Int) {}
 func functionWithDifferentLabels(top: Int, bottom: Int) {}
 
 var f = someFunction // 函数f的类型为 (Int, Int) -> Void, 而不是 (left: Int, right: Int) -> Void.
 f = anotherFunction              // 正确
 f = functionWithDifferentLabels  // 正确
 
 func functionWithDifferentArgumentTypes(left: Int, right: String) {}
 func functionWithDifferentNumberOfArguments(left: Int, right: Int, top: Int) {}
 
 f = functionWithDifferentArgumentTypes     // 错误
 f = functionWithDifferentNumberOfArguments // 错误
 */

//如果一个函数类型包涵多个箭头(->)，那么函数类型将从右向左进行组合。例如，函数类型 Int -> Int -> Int 可以理解为 Int -> (Int -> Int)，也就是说，该函数类型的参数为 Int 类型，其返回类型是一个参数类型为 Int，返回类型为 Int 的函数类型。

//函数类型若要抛出错误就必须使用 throws 关键字来标记，若要重抛错误则必须使用 rethrows 关键字来标记。throws 关键字是函数类型的一部分，非抛出函数是抛出函数函数的一个子类型。因此，在使用抛出函数的地方也可以使用不抛出函数。

//Swift 语言为标准库中定义的 Array<Element> 类型提供了如下语法糖：[类型]
let someArray: Array<String> = ["Alex", "Brian", "Dave"]
let someArray1: [String] = ["Alex", "Brian", "Dave"]//两者等价

//Swift 语言为标准库中定义的 Dictionary<Key, Value> 类型提供了如下语法糖：[键类型 : 值类型]
let someDictionary: [String: Int] = ["Alex": 31, "Paul": 39]
let someDictionary1: Dictionary<String, Int> = ["Alex": 31, "Paul": 39]//两者等价

//Swift 定义后缀 ? 来作为标准库中的定义的命名型类型 Optional<Wrapped> 的语法糖。
var optionalInteger: Int?
var optionalInteger1: Optional<Int>//两者等价

//Swift 语言定义后缀 ! 作为标准库中命名类型 Optional<Wrapped> 的语法糖
var implicitlyUnwrappedString: String!
var explicitlyUnwrappedString1: Optional<String>//两者等价


//由于隐式解包修改了包涵其类型的声明语义，嵌套在元组类型或泛型的可选类型（比如字典元素类型或数组元素类型），不能被标记为隐式解包。
//let tupleOfImplicitlyUnwrappedElements: (Int!, Int!)  // 错误
let implicitlyUnwrappedTuple: (Int, Int)!             // 正确
//let arrayOfImplicitlyUnwrappedElements: [Int!]        // 错误
let implicitlyUnwrappedArray: [Int]!                  // 正确

//协议合成类型是一种符合协议列表中每个指定协议的类型。协议合成类型可能会用在类型注解和泛型参数中。协议合成类型的形式如下：Protocol 1 & Procotol 2
//协议合成类型允许你指定一个值，其类型符合多个协议的要求且不需要定义一个新的命名型协议来继承它想要符合的各个协议。比如，协议合成类型 Protocol A & Protocol B & Protocol C 等效于一个从 Protocol A，Protocol B， Protocol C 继承而来的新协议 Protocol D，很显然这样做有效率的多，甚至不需引入一个新名字。

//元类型是指类型的类型，包括类类型、结构体类型、枚举类型和协议类型。

//类、结构体或枚举类型的元类型是相应的类型名紧跟 .Type。协议类型的元类型——并不是运行时符合该协议的具体类型——而是该协议名字紧跟 .Protocol。比如，类 SomeClass 的元类型就是 SomeClass.Type，协议 SomeProtocol 的元类型就是 SomeProtocal.Protocol。

//你可以使用后缀 self 表达式来获取类型。比如，SomeClass.self 返回 SomeClass 本身，而不是 SomeClass 的一个实例。同样，SomeProtocol.self 返回 SomeProtocol 本身，而不是运行时符合 SomeProtocol 的某个类型的实例。还可以对类型的实例使用 type(of:) 表达式来获取该实例在运行阶段的类型，如下所示：

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
// someInstance 在编译期是 SomeBaseClass 类型，
// 但是在运行期则是 SomeSubClass 类型
type(of: someInstance).printClassName()
// 打印 “SomeSubClass”

//可以使用恒等运算符（=== 和 !==）来测试一个实例的运行时类型和它的编译时类型是否一致。
if type(of: someInstance) === someInstance.self {
    print("The dynamic and static type of someInstance are the same")
} else {
    print("The dynamic and static type of someInstance are different")
}
// 打印 "The dynamic and static type of someInstance are different"

//可以使用初始化表达式从某个类型的元类型构造出一个该类型的实例。对于类实例，被调用的构造器必须使用 required 关键字标记，或者整个类使用 final 关键字标记。
class AnotherSubClass: SomeBaseClass {
    let string: String
    required init(string: String) {
        self.string = string
    }
    override class func printClassName() {
        print("AnotherSubClass")
    }
}
let metatype: AnotherSubClass.Type = AnotherSubClass.self
let anotherInstance = metatype.init(string: "some string")

//类型继承子句被用来指定一个命名型类型继承自哪个类、采纳哪些协议。类型继承子句也用来指定一个类类型专属协议。类型继承子句开始于冒号 :，其后是所需要的类、类型标识符列表或两者都有。
