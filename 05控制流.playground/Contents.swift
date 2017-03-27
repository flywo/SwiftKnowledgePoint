//: Playground - noun: a place where people can play

import UIKit

/************for-in循环*************/
//可以用来遍历一个集合中的所有元素
for index in 1...10 {//index无需声明，只需要包含再循环语句中，自动对其进行隐式声明
    print(index)
}
for _ in 1...10 {//如果不需要使用index，使用_替代即可
    print("...")
}

//遍历字典
let numbers = ["s": 10, "b": 11]
for (key, value) in numbers {
    print(key, value)
}


/*************while循环*****************/
//一直运行，知道条件变成false

//while
var number = 0
while number < 10 {
    print("+++++")
    number += 1
}

//repeat-while
//判断循环条件之前，先执行一次循环的代码块，然后重复循环直到条件为false
repeat {
    print("至少打印一次")
} while false


/****************条件语句*****************/
//if

//switch
//把某个值与若干个模式进行匹配，根据第一个匹配成功的模式，执行对应的代码
let some: Character = "z"
switch some {
case "a":
    print("这是a")
default:
    print("这是其他的")
}

//执行完case后，会终止switch语句，可以使用break提前跳出

//每一个case都必须包含一条语句

//如果需要同时匹配多个值，可以组成复合匹配，用逗号分开
let another = "a"
switch another {
case "1","a":
    print("匹配成功")
default:
    print("匹配不成功")
}

//可以使用fallthrough贯穿

//区间匹配
let score = 99
switch score {
case 0:
    print("你是猪吗")
case 1..<60:
    print("比猪聪明")
case 60...100:
    print("及格了")
default:
    print("靠，有鬼")
}

//可以使用元组在同一个switch语句中测试多个值，元组中的元素可以是值，也可以是区间。使用下划线匹配所有可能的值
let point = (1, 1)
switch point {
case (0, 0):
    print("原点")
case (0...1, 0...1):
    print("第一")
case (0...1, -1...0):
    print("第四")
default:
    print("不知道去哪儿了")
}

//值绑定
//case分支允许将匹配的值绑定到一个临时的常量和变量，并且在内部使用
let ano = (2, 0)
switch ano {
case (let x, 0):
    print(x)
default:
    print("别的")
}

//where，分支可以使用where来判断额外的条件
let a = 10
let b = 1
switch a {
case 10 where b == 0:
    print("匹配1")
case 10 where b == 1:
    print("匹配2")
default:
    print("不匹配")
}


/***********复合匹配************/
//可以把多种可能放入同一个case后面
let so = "e"
switch so {
case "a","v",
     "c","e"://可以分行书写
    print("一")
default:
    print("no")
}

//复合匹配可以包含值绑定
let opoint = (9, 0)
switch opoint {
case (let x, 0), (0, let x):
    print("\(x)")
default:
    print("不匹配")
}

/***********控制转移语句************/
//continue:停止本次循环
//break：理解结束整个控制流的执行
//fallthrough:贯穿
let bc = 1
switch bc {
case 1:
    print("111")
    fallthrough
case 2:
    print("222")
default:
    print("--")
}
//带标签的语句
//使用标签标记一个循环体或者条件语句，条件语句可以使用break加标签的方式，来结束这个被标记的语句

//guard语句：条件被满足，执行guard语句大括号后的代码，否则else分支代码执行
if #available(iOS 10, *) {
    print("iOS10")
}else {
    print("老版本")
}
