//: Playground - noun: a place where people can play

import UIKit

/*
 字符串，是有序的字符Character类型的值的集合，通过String表示
 */

/***************字符串*******************/
//字符串字面量是由“”包裹起来的有序的文本字符集
let some = "some value"

//创建空字符串，可以将空字符串的字面量赋值给变量
let empty1 = ""
let empty2 = String()

//可以通过isEmpty判断字符串是否为空
empty1.isEmpty

//可以将特定字符串分配给一个变量来进行修改
var string = "some value"
string += "you"

//String是值类型，创建了一个新的字符串，进行赋值操作时，会进行值拷贝，对已知字符串值创建新的副本，并对新的副本进行操作
var string1 = string
string1 += "you"
string

//通过字符串的characters属性遍历
for c in "Dog".characters {
    print(c)
}

//创建一个字符常量和变量
let ex: Character = "!"

//字符串可以通过传递一个值类型为Character的数组作为变量来初始化
let chars: [Character] = ["c", "a", "t"]
let char = String(chars)
print(char)

//连接字符串和字符
let str1 = "Hello"
let str2 = "world"
var str3 = str1 + str2

//可以通过append将一个字符附加到一个字符串变量尾部
str3.append("!")

//字符串插值，可以插入常量、变量、字面量和表达式

//字符串字面量中特殊字符
//转义字符：\0空字符  \\反斜线  \t水平制表符  \n换行符  \r回车符  \"双引号  \'单引号
//Unicode标量：\u{n},u小写，n一到八位十六进制数且可用的Unicode码位

//计算字符数量，通过字符串的characters的count属性获得
str2.characters.count


/*****************字符串索引*****************/
//每一个String值都有一个关联的索引类型，String.Index，对应着字符串中每一个Character的位置，不同的字符可能会占用不同数量的内存空间，要知道字符的确定位置，就必须从String开头遍历每一个Unicode标量知道结尾，因此，字符串不能用整数做索引
//startIndex属性可以获取一个String的第一个Character的索引
//endIndex属性获得最后一个位置的索引,endIndex不能作为一个字符串的有效下标
//index(before:)获得前面一个索引
//index(after:)获得后面一个索引
//index(_:offsetBy:)获取对应偏移量的索引

//可以使用下标语法来访问特定索引的字符
let green = "green"
green[green.startIndex]
green[green.index(before: green.endIndex)]
green[green.index(after: green.startIndex)]
green[green.index(green.startIndex, offsetBy: 4)]
//如果获取越界，会引发错误

//字符属性的indices属性会创建一个包含全部索引的范围range，用来在一个字符串中访问单个字符
for index in green.characters.indices {
    print("\(green[index])", terminator: " ")
}
//startIndex和endIndex属性，或者index(before:)、index(after:)、index(_:offsetBy:)方法在任意一个确认的并遵循collection协议的类型里面，都可以使用的，比如String,Array,Dictionary,Set等

//插入和删除，insert(_:at:)指定索引插入字符，inset(contentof:at:)在指定索引插入字符串数组
var welcome = "Hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: "world!".characters, at: welcome.index(after: welcome.startIndex))

//调用remove(at:)删除指定索引的字符，removeSubrange(_:)在字符串的指定索引删除一个子字符串
welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome
let range = welcome.index(after: welcome.startIndex) ..< welcome.index(welcome.startIndex, offsetBy: 7)
welcome.removeSubrange(range)
welcome














