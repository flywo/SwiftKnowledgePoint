//: Playground - noun: a place where people can play

import UIKit

//析构器只适用类类型，当一个类的实例被释放之前，析构器会立即被调用，用deinit来标示，类似于构造器用init
//deinit {
    //执行析构过程
//}
class Test {
    deinit {
        print("对象被释放")
    }
}
var t: Test? = Test()
t = nil