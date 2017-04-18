//: Playground - noun: a place where people can play

import UIKit

//泛型：能够根据自定义的需要，编写适用于任意类型，灵活可重用的函数及类型，避免代码重复。

//泛型函数：泛型函数使用任何类型
func swapa<T>(_ a: inout T, _ b: inout T) {
    let A = a
    a = b
    b = A
}
//占位类型名：没有指明类型，但是指明a和b必须是同一类型T，无论T代表的什么
//<>：swift不会去查找<>内的实际类型
var a = 0
var b = 10
swapa(&a, &b)

//类型参数：一旦一个类型参数被指定，可以用来定义一个函数的参数类型，或者作为函数的返回类型，还可以作为函数主题中的注释类型

//多个类型参数：可以提供多个，都卸载尖括号中，用逗号分开

//命名类型参数：Dictionary<key,value>

//泛型类型：允许定义泛型类型，这些自定义类、结构体和枚举可以适用于任何类型。
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

//扩展一个泛型类型：当扩展一个泛型类型的时候，不需要在扩展的定义中提供类型参数列表。
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count-1]
    }
}

//类型约束：可以指定一个类型参数必须继承自指定类，或者符合一个特定的协议或协议组合

//约束语法：类型参数名后放置一个类名或者协议名，用冒号分割来约束
class Some {}
protocol SomeP {}
func someFunc<T: Some, U: SomeP>(T: T, U: U) {
}

//关联类型：关联类型为协议中的某个类型提供一个占位名，代表的实际类型在协议被采纳时才会被指定，associatedtype指定关联类型
protocol Container {
    associatedtype ItemType
}

//泛型where语句：能够为泛型函数或泛型类型的类型参数定义一些强制要求
//func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {}

//泛型where子句扩展：可以使用泛型where子句作为扩展的一部分。
extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}