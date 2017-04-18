//: Playground - noun: a place where people can play

import UIKit

//空白：分隔源文件中的符号以及帮助区分运算符属于前缀还是后缀（参见 运算符），在其他情况下空白则会被忽略。

//注释：注释被编译器当作空白处理。单行//，多行/*...*/

//标识符：可以由以下的字符开始：大写或小写的字母 A 到 Z、下划线 (_)、基本多文种平面 (Basic Multilingual Plane) 中非字符数字组合的 Unicode 字符以及基本多文种平面以外的非个人专用区字符。在首字符之后，允许使用数字和组合 Unicode 字符。

//使用保留字作为标识符：需要在其前后增加反引号 (`)。例如，class 不是合法的标识符，但可以使用 `class`。反引号不属于标识符的一部分，`x` 和 x 表示同一标识符。

//闭包中如果没有明确指定参数名称，参数将被隐式命名为 $0、$1、$2 等等。这些命名在闭包作用域范围内是合法的标识符。

/*
 下面这些被保留的关键字不允许用作标识符，除非使用反引号转义，具体描述请参考 标识符。除了 inout、var 以及 let 之外的关键字可以用作某个函数声明或者函数调用当中的外部参数名，不用添加反引号转义。
 
 用在声明中的关键字： associatedtype、class、deinit、enum、extension、func、import、init、inout、internal、let、operator、private、protocol、public、static、struct、subscript、typealias 以及 var。
 用在语句中的关键字：break、case、continue、default、defer、do、else、fallthrough、for、guard、if、in、repeat、return、switch、where 以及 while。
 用在表达式和类型中的关键字：as、catch、dynamicType、false、is、nil、rethrows、super、self、Self、throw、throws、true、try、#column、#file、#function 以及 #line。
 用在模式中的关键字：_。
 以井字号 (#) 开头的关键字：#available、#column、#else#elseif、#endif、#file、#function、#if、#line 以及 #selector。
 特定上下文中被保留的关键字： associativity、convenience、dynamic、didSet、final、get、infix、indirect、lazy、left、mutating、none、nonmutating、optional、override、postfix、precedence、prefix、Protocol、required、right、set、Type、unowned、weak 以及 willSet。这些关键字在特定上下文之外可以被用做标识符。
 以下符号被当作保留符号，不能用于自定义运算符： (、)、{、}、[、]、.、,、:、;、=、@、#、&（作为前缀运算符）、->、`、?、!（作为后缀运算符）。
 */

/*
 转义特殊符号如下：
 空字符 \0
 反斜线 \\
 水平制表符 \t
 换行符 \n
 回车符 \r
 双引号 \"
 单引号 \'
 Unicode 标量 \u{n}，n 为一到八位的十六进制数字
 */
