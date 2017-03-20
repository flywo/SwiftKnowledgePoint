//: Playground - noun: a place where people can play

import UIKit

/*********常量和变量：let声明常量，var声明变量**********/
let a = 10
var b = 20
//可以同时声明多个常量或变量，用逗号隔开
var c = 0, d = 10, e = 30


/*********类型标注******************
 声明常量和变量的时候加上类型标注，说明常量和变量中要存储的值的类型，在常量或变量后面加上一个冒号和空格，然后加上类型名称*/
var message: String

//现在message可以被设置成任意字符串
message = "sorry"

//可以定义多个同样类型的变量，然后加类型标注
var red, green, blue: Double

//一般来说不需要写类型标注，如果赋值了，会推断出该常量或变量的类型


/***********常量和变量名*************/
//可用任意字符做常量和变量名，Unicode字符也可
let π = 3.14
let 哈罗 = "Hello"

//但是不能包含数学符号，箭头，保留的Unicode码位，连线与制表符，不能以数字开头
//一旦常量和变量声明为确定的类型，就不能使用相同的名字再次进行声明或者修改其存储值的类型，也不能将常量和变量进行互转

//输出常量和变量
//print()函数来输出
print(哈罗)

//print(_: separator: terminator:)
//separator:分隔符    terminator:结束符

//采用字符串插值的方式把常量名和变量名当做占位符加入到长字符串中
print("π的值为\(π)")


/**************注释******************/
//（//）表示单行注释    （/**/）多行注释，多行注释可以嵌套


/****************分号*******************/
//每句语句结尾处不需要使用;，但是当一行内有多条语句时，必须要用分号隔开
let cat = "🐱"; print(cat)


/****************整数*******************/
//没有小数的数字，提供了8、16、32、64位的整数

//可以通过整数类型的max和min属性获取最大值和最小值
print(UInt.max)
print(UInt8.min)

//一般情况下，不需要指定整数长度，使用Int即可。Int长度和当前平台的原生字长相同
//32位上，Int和Int32相同  64位上，Int和Int64相同

//Uint无符号类型，同Int类型


/*****************浮点数******************/
//有小数的数字
//Double表示64位浮点数，存储高精度时使用，优先选择Double
//Float表示32位浮点数，精度要求不高时使用


/****************类型安全和类型推断*******************/
/*
 Swift是类型安全的语言，意味着你需要清楚的知道代码要处理的值的类型，比如代码需要一个String,传进去Int是不允许的。
 声明变量或常量时，如果没有显示指定类型，Swift会使用类型推断来选择合适的类型。
 */
let score = 99//score会被推断为Int
let pi = 3.14//pi是Double类型，浮点数默认推断为Double
let PI = 3+0.14//PI被推断为Double


/***************数值型字面量********************/
/*
 十进制：没有前缀
 二进制：0b
 八进制：0o
 十六进制：0x
 */
//下方所有整数字面量的十进制都是17
let number1 = 17
let number2 = 0b10001
let number3 = 0o21
let number4 = 0x11

//浮点字面量
/*
 十进制
 1.25e2 = 1.25*10^2 = 125.0
 1.25e-2 = 1.25*10^-2 = 0.0125
 十六进制
 0xFp2 = 15*2*2 = 60
 0xFp-2 = 15*2^-2 = 3.75
 */
//下方字面量都是等于十进制的12.1875
let number5 = 12.1875
let number6 = 1.21875e1
let number7 = 0xC.3p0

//可以添加额外的0或者下划线
let pad = 000124.56
let padd = 1_000_000


/****************数值型类型转换*******************/
//整数请使用Int类型，除非需要优化性能、内存占用等问题
//类型转换，SomeType(ofInitialValue)进行类型转换
let one: UInt8 = 1
let two: UInt16 = 2_000
//相同类型的值才能进行计算
let three = UInt16(one) + two

//浮点数和证书转换必须显示指定类型
let one1 = 3
let two1 = 1.1
let three1 = Double(one1) + two1

//字面量不同类型是可以直接相加的，因为字面量本身没有明确的类型，只在编译器需要求值的时候被推测
let one2 = 3 + 0.11


/*******************类型别名*********************/
//类型别名就是给现有类型定义另一个名字，可以使用typealias关键字来定义类型别名
typealias AudioSample = UInt16
var max = AudioSample.max
print(max)


/*******************布尔值*********************/
//布尔值，只能是True或False
let oranges = true
if oranges {
    print("真")
}

//与OC不同，应该使用布尔值时，必须是布尔值，否则会报错


/*******************元组*********************/
//把多个值组合成一个复合值，元组内可以是任意类型，并不要求是相同类型。
let http404 = (404, "not found")//一个类型为(Int, String)的元组

//将元组内容分解成单独的常量和变量，然后就可以使用了
let (number, numberMessage) = http404
print(number)
print(numberMessage)

//如果只需要部分值，可以使用_忽略
let (number_, _) = http404
print(number_)

//可以通过下标访问，下标从0开始
print(http404.0)
print(http404.1)

//可以在定义元组时给单个元素命名
let http200 = (code: 200, description: "OK")
print(http200.code)
print(http200.description)


/******************可选类型**********************/
/*
 optionals处理值可能确实的情况
 */
let possible = "213"
let converted = Int(possible)//converted是 Int? 类型

//可选变量可以赋值为nil
var maybe0: Int? = 404
maybe0 = nil
//nil不能用于非可选的常量和变量

//声明一个可选常量或变量没有赋值，自动默认为nil
var survey: String?//survey = nil
//swift中的nil表示一个值，表示没有值，不是一个指针，任何类型都可以被设置为nil。

//if语句以及强制解析
//可以使用if语句和nil来判断一个可选值是否包含值
if survey == nil {
    print("为空")
}

//当确定有值后，名字后面使用！来获取值，称为强制解析
survey = "sorry"
if survey != nil {
    print("\(survey!)")
}
//不存在的值，强制解析会报错

//可选绑定：判断可选类型是否包含值，包含就赋值给一个临时常量或变量
if var sur = survey {
    if sur == "sorry" {
        sur = "wokao"
    }
    print(sur)
}

//可以包含多个可选绑定和多个布尔条件在一个if语句中，只要使用逗号分开。只要有一个可选绑定的值为nil或者任意一个布尔条件未false，则整个if条件判断为false
if var _ = survey, possible == "123" {
    print("条件通过！")
}else {
    print("不通过！")
}
//在if条件语句中使用常量和变量来创建一个可选绑定，仅在if语句的句中(body)中才能获取到值，相反，在guard语句中使用常量和变量来创建一个可选绑定，仅在guard语句外且在语句后才能获取到值


/*****************隐式解析可选类型***********************/
/*
 当可选类型被第一次赋值后就可以确定之后会一直有值时，就可以使用隐式可选类型
 */
let forc: String!
forc = "隐式可选"
print(forc)
//隐式可选如果没有值，取值会报错

//可以把隐式可选当成可选类型来判断
if forc != nil {
    print("不为空")
}

//可以使用可选绑定检查取值
if let force = forc {
    print(force)
}


/******************错误处理**********************/
//使用错误处理来应对程序执行中可能会遇到的错误条件
func canThrowError() throws {
    //该函数可能抛出错误
}
//如果一个函数有可能抛出错误，就需要使用try关键词进行获得错误
do {
    try canThrowError()
    //没有错误
} catch {
    //有错误
}

/*
 判断抛出的错误类型
 func makeASandwich() throws {
 //会抛出各种错误
 }
 
 do {
    try makeASandwich()
    eatASandwich()  如果没有错误，就会执行该方法
 } catch SandwichError.outOfCleanDishes {
    washDishes()  发现该错误，会执行该方法
 } catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)  发现错误，并使用catch捕获的关联值赋值为ingredients作为参数使用
 }
 */


/****************断言*****************/
//判断值是否存在，不存在就终端代码通过调试信息找到原因
//assert(_:_:file:line:)
let age = 3
assert(age >= 0, "年龄必须要大于0")//如果小于0，程序会中断
//如果不需要断言信息，可以省略
assert(age >= 0)

/*使用断言的情况：
 1.整数类型的下标索引被传入一个自定义下标实现，但是该索引值可能太小或者太大
 2.需要给函数传入一个值，但是非法的值可能导致函数不能正常执行
 3.一个可选值现在是nil，后面代码可能需要一个非nil的值*/
