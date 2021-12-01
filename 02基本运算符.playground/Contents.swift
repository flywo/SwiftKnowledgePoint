// 分配符
let a = 1
var b = 2
b = a
let (x, y) = (a, b)
// 算术运算符
a + b
a - b
a * b
a / b
"a" + "v"
// 求余
a % b
// 一元运算
-a
// 符合分配
b += 1
// 比较
a == b
a != b
a < b
a > b
a <= b
a >= b
// 元祖也可以进行比较，元祖比较时会依次进行比较，如果不等，会直接返回结果
(1, 2) > (2, 4)
// 三元运算
a > 10 ? "1" : "2"
// 零编码运算符
var c: Int? = 1
b = c ?? 2
// 范围操作符
var d = 1...5
for index in 1..<5 {}
print(d)
// 单面范围
let f = [1,1,1,1,1,1,1,1,1]
print(f[2...])
print(f[...4])
print(f[..<4])
let h = ...5
print(h)
// 逻辑运算符 ! && ||
let aa = true
!aa
