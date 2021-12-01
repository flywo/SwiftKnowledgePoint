// 字符串
let a = "a"
// 多行字符串，开始"""之后第一行开始，结束"""之前第一行结束
let b = """
a
b
c
"""
// 字符串内，让代码显示换行，实际上最终显示不换行
let c = """
aaa\
aaa
bbb
"""
print(c)
// 多行字符串统一缩进
let d = """
    a
        b
    c
    """
print(d)
// 扩展分隔符，内部的字符串不会进行转义操作
let f = #"ab"""\\\naaaaa#dfdscd"#
print(f)
// 空字符串
var aa = ""
aa = String()
aa.isEmpty
// 字符串可变
aa += "a"
// for-in遍历字符串
for c in "abc" {
    print(c)
}
// 字符
let cha: Character = "a"
// 字符串添加字符
aa.append(cha)
// 扩展字符串内使用插值
aa = #"dfadfsfs\#(4 * 8)cccc"#
print(aa)
// 字符串下标
aa[aa.startIndex]
// 字符串所有索引
for index in aa.indices {
    print(aa[index])
}
// 子字符串
let bb = aa[..<aa.index(before: aa.endIndex)]
print(bb)

