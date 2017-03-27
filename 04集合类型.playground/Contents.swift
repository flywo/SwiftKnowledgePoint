//: Playground - noun: a place where people can play

import UIKit

//swift提供了array,set,dictionarie三种基本的集合类型用来存储集合数据。三种类型中存储的数据值类型必须是明确的，意味着我们不能把不正确的数据类型插入其中。

//如果三种集合类型被分配成一个变量，这个集合将会使可变的，意味着我们可以在创建之后添加更多或移除已存在的数据项，改变集合中的数据项。

//编译器会优化不可变集合


/***************数组Array*****************/
//有序列表存储同一类型的多个值，相同的值可以出现在一个数组中不同位置
//数组遵循：Array<Element>,Element是数组中允许存在的数据类型，也可以通过[Element]这样创建

//创建空数组
var someInts = [Int]()
//someInts的值类型被推断为[Int]，此时若再要创建空数组，使用[]即可
someInts = []

//创建待默认值的数组
var doubles = Array(repeating: 0.0, count: 3)
//创建特定大小并且所有数据都被默认的构造方法

//通过数组相加创建数组
var six = doubles + Array(repeating: 1, count: 3)
//新的数组的数据类型会被从两个数组中的数据类型中推断出来

//数组字面量构造数组
var shopping: [String] = ["Eggs", "Milk"]
//数组字面量是一系列由逗号分割并由括号包含的数值
var shoppings = ["a", "b"]//[String]数组类型可以不定义

//访问和修改数组
//通过数组的方法和属性来访问和修改数组，或者使用下标语法
shoppings.count//数组中数据项数量
shoppings.isEmpty//检查是否为空
shoppings.append("c")//添加新数据项
shoppings += ["d"]//添加一个或多个相同类型的数据项
shoppings[0]//使用下标语法获取数据项
shoppings[0] = "aa"//使用下标改变某个已有索引值对应的数据项
shoppings[1...3] = ["vvv"]//修改一些列的数据项
//但是不可以用下标访问的形式在数组尾部添加新的项
shoppings
shoppings[1...1] = ["cc","dd"]
shoppings
shoppings.insert("bb", at: 0)//在某个索引值前添加数据项
shoppings.remove(at: 0)//移除某个索引值中存储的数据项，并且返回该数据项
shoppings.removeLast()//移除掉最后一个数据项

//遍历数组
for item in shoppings {
    print(item)//遍历元素
}
for (index, value) in shoppings.enumerated() {
    print(index, value, separator: "-")//遍历索引和元素
}


/****************集合Set******************/
//set存储相同类型并且没有确定顺序的值，元素只出现一次，不会重复

//set中存储的类型必须是可哈希化的，也就是说类型必须提供一个方法计算它的哈希值，一个哈希值是Int类型，相等的对象哈希值必须相同，比如a==b，则a.hashvalue == b.hashvalue

//所有基本类型string,int,double,bool都是可哈希化的，没有关联值的枚举成员值也是可哈希化的

//自定义的类型作为set的值类型或者dic的键类型，需要自定义类型符合hashable协议，提供一个类型为int的可读属性hashvalue

//Set<Element>，集合没有简化形式

//创建空集合
var letters = Set<Character>()
//上下文提供类型信息，可以用[]创建空set
letters = []

//数组字面量创建
var favorite: Set<String> = ["rock", "class", "hip"]
//set必须显示声明。但是由于推断功能，使用数组字面量创建set时，可以不用写出具体类型
var favorites: Set = ["a", "b"]

//访问和修改集合
//使用属性和方法来访问和修改一个set
favorite.count//元素数量
favorite.isEmpty//检查是否为空
favorite.insert("dd")//插入新元素
favorite
favorite.remove("dd")//删除，并返回，如果不包含，返回nil
favorite.contains("rock")//检查是否包含特定值

//遍历集合
for genre in favorite {
    print(genre)
}
//按照顺序遍历，使用sorted()方法，返回有序数组，数组的元素排序由操作符"<"对元素比较的结果来确定
for genre in favorite.sorted() {
    print(genre)
}

//集合操作
let odd: Set = [1,3,5,7,9]
let even: Set = [0,2,4,6,8]
let sing: Set = [2,3,5,7]
odd.union(even).sorted()//根据两个集合的值创建新的集合
odd.intersection(even).sorted()//根据两个集合中都包含的值创建新集合
odd.subtracting(sing).sorted()//根据不在该集合中的值创建新的集合
odd.symmetricDifference(sing).sorted()//根据一在一个集合中但不在两个集合中的值创建新的集合

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals == farmAnimals//判断元素是否相同
houseAnimals.isSubset(of: farmAnimals)//判断一个集合中的值是否也被包含再另外一个集合中
farmAnimals.isSuperset(of: houseAnimals)//判断一个集合中是否包含另一个集合中所有的值
houseAnimals.isStrictSubset(of: farmAnimals)//判断一个集合是否是另外一个集合的子集合，并且两个集合不相等
houseAnimals.isStrictSuperset(of: farmAnimals)//是否是另外一个集合的父集合，并且两个集合不相等
farmAnimals.isDisjoint(with: cityAnimals)//判断两个集合是否不含有相同的值


/**************字典****************/
//可以存储多个相同类型的值的容器，每个值都关联着唯一的键。

//Dictionary<key, value>定义，key键数据类型，value值数据类型，key必须遵循hashable协议

//[key: value]简化形式创建

//空字典
var names = [Int: String]()
//已知后，可以简化
names = [:]

//字面量创建字典
var air = [1: "a", 2: "b"]

//访问和修改字典
air.count//数量
air.isEmpty//判空
air[1]//下标获取
air[1] = "aa"//下标修改
air
air.updateValue("cc", forKey: 2)//更新,如果键值不存在，会创建新的键值，返回更新值之前的原值，用于检查是否更新成功，否则会返回nil
if let old = air.updateValue("ccc", forKey: 2) {
    print("旧值:\(old)")
}
air[3] = "ff"
air

//下标语法获取特定键对应的值，返回对应类型的可选值
if let airp = air[4] {
    print("存在")
}else {
    print("不存在")
}

//下标语法给某个键的对应值赋值为nil，从而移除该键值对
air
air[1] = nil
air

//也可以用方法来移除，该方法在存在时返回移除的值，不存在时，返回nil
if let remove = air.removeValue(forKey: 2) {
    print("存在")
}else {
    print("不存在")
}

//字典遍历
for (code, name) in air {
    print(code, name)
}

//访问keys,values遍历
for code in air.keys {
    print(code)
}
for value in air.values {
    print(value)
}

//使用keys和values构造新的数组
let aircodes = [Int](air.keys)
let airnames = [String](air.values)

//可以对keys和values使用sorted()方法排序
