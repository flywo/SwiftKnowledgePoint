// 常量
let v1 = 10
// 变量
var v2 = 10
// 同时声明多个常量和变量
let v11 = 0, v22 = 0, v33 = 0
var v21 = 0, v35 = 0, v44 = 0
// 类型注释
var value: String
value = "1"
// 同时声明多个常量和变量的类型注释
var vv1, vv2, vv4: String
// 如果某个变量是系统关键字，想再次声明同样名称的变量，可用``声明
let `self` = 111
print(self)
// 字符串插值
let aa = "adfdfd\(self)dffdfd"
// 整数边界
Int.max
Int.min
// double是64位浮点数，float是32位浮点数
// 类型转换
let tree = Double(v1)
// 类型别名
typealias CustomType = Int
var custom = CustomType.max
// 布尔
true
false
// 元祖
let error = (404, "not fond")
// 分解元祖
let (code, msg) = error
code
msg
// 忽略元祖元素
let (_, g) = error
// 下标访问
error.0
// 命名元祖元素
let err = (code: 400, msg: "not fond")
err.code
// 可选值
var values: Int? = 404
values = nil
// 强制打开
values = 1
values!
// 可选绑定
if let values = values {
    print(values)
}
// 隐含可选
var va: Int! = 1
va
// 隐含可选用法和可选值一样
if let va = va {}
if va == nil {}
// 错误处理
func can() throws {}
do {
    try can()
} catch {
}
// 断言
assert(v1>10, "abc")
// 先决条件
precondition(v1>10, "ffff")
