//: Playground - noun: a place where people can play

import UIKit


//构造过程：使用类，机构提或枚举类型的实例之前的准备过程。新实例必须执行这个过程，包括设置属性初始值和其它工作。
//swift的构造器无需返回值，主要任务是保证新的实例在第一次使用前完成正确的初始化
//类实例可以通过析构器在实例释放之前执行特定的清除工作

//存储属性的初始赋值：为存储属性设置默认值或者在构造器中为其赋值时，不会触发属性观察者

//构造器：以关键字init命名，最简单的是不带任何参数的实例方法
struct Fa {
    var tem: Double
    let temp = 99
    init() {
        tem = 90
    }
}
var f = Fa()
f.tem

//默认属性值：可以在构造器中为存储属性设置初始值，也可以在属性声明时设置默认值
//如果属性总是使用相同的初始值，设置默认值好。

//构造参数
struct Cel {
    var tem: Double
    init(from: Double) {
        tem = from
    }
    init(to: Double) {
        tem = to
    }
}
var cel = Cel(from: 120)
cel.tem
cel = Cel(to: 11)
cel.tem

//参数内部名称和外部名：跟函数和方法相同。

//不带外部名的构造器参数：_显示描述外部名，可以不提供参数外部名
struct Cell {
    var tem: Double
    init(_ cel: Double) {
        tem = cel
    }
}
let celll = Cell(45)
celll.tem

//可选属性类型
class Sur {
    var text: String
    var res: String?
    init(text: String) {
        self.text = text
    }
}

//构造过程中常量属性的修改：可在构造过程中给常量属性指定一个值。常量属性只能在定义它的类的构造过程中被修改，不能再子类中修改
class Sr {
    let text: String
    init() {
        text = "333"
        //text = "444"//设置一次后就不能再修改
    }
}

//默认构造器：结构体和类的所有属性都有默认值，同时没有自定义构造器，swift会给这些结构体和类提供一个默认构造器，简单的创建一个所有属性值都设置为默认值的实例
class Shopp {
    let name = "apple"
    var number: Double?
}
let shop = Shopp()

//结构体逐一成员构造器：结构体如果没有提供自定义的构造器，他们将自动获得一个逐一成员构造器，即使结构体的存储属性设有默认值
struct size {
    var width = 0, height = 0
}
let two = size(width: 10, height: 20)
two.width

//值类型的构造器代理：构造器可以通过调用其它构造器来完成构造过程
//值类型：使用self.init在自定义的构造器中引用其它构造器。如果为值类型定义了自定义的构造器，将无法访问到默认构造器，结构体还将无法访问逐一成员构造器
//假如希望默认构造器、逐一成员构造器以及自定义的构造器都能用来创建实例，可以将自定义的构造器写到扩展中，而不是写在值类型的定义中
struct Size1 {
    var width = 0, height = 0
}
struct Point {
    var x = 0, y = 0
}
struct Rect {
    var ori = Point()
    var size = Size1()
    init() {}//和默认构造器是一样的，返回默认值
    init(ori: Point, size: Size1) {//同逐一成员构造器
        self.ori = ori
        self.size = size
    }
    init(center: Point, size: Size1) {
        self.init(ori: center, size: size)
    }
}

//指定构造器和便利构造器
//指定构造器：初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。每一个类都必须有用至少一个指定构造器。
//便利构造器是类中比较次要的构造器。自定义便利构造器来调用同一个类中指定构造器，并为其提供默认值。

//指定构造器：
//init(parameters) {
//    statements
//}

//便利构造器
//convenience init(parameters) {
//    statements
//}

/*构造器之间代理调用：
 1.指定构造器必须调用其直接父类的指定构造器
 2.便利构造器必须调用同类中定义的其它构造器
 3.便利构造器必须最终导致一个指定构造器被调用
 */

//两段式构造过程：第一个阶段，每个存储属性被引入他们的类指定一个初始值。当每个存储属性初始值被确定后，第二阶段开始，给每个类一次机会，在实例准备使用前进一步定义存储属性。

//编译器4中安全检查机制：
/*
 1.指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其它构造任务向上代理给父类中的构造器，所以一个对象的内存只有在其所有存储型属性确定之后才能完全初始化。所以指定构造器必须保证所在类引入的属性在往上代理之前完成初始化
 2.指定构造器必须向上代理调用父类构造器，在设置新值，不设置的话，会使用父类默认的值
 3.遍历构造器必须先调用其它构造器，然后在为任意属性赋新值
 4.构造器在第一阶段构造完成前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用self作为一个值
 */

//构造器的继承和重写：swift中子类默认情况下不会继承父类的构造器。
//同父类相同的指定构造器，需要加上override。遍历构造器则不需要。
class Veh {
    var number = 0
    var description: String {
        return "\(number)"
    }
}
class Bic: Veh {
    override init() {
        super.init()
        number = 100//子类可以在初始化时，修改继承来的变量属性
    }
}

/*
 构造器自动继承：
 1.如果子类没有定义任何指定构造器，自动继承父类所有指定构造器
 2.如果子类提供了所有父类指定构造的实现
 */

//可失败构造器：构造过程可能会失败，则定义为可失败构造器，语法为在init关键字后面添加问号init?
//可失败构造器参数名和参数类型，不能与其他非可失败构造器的参数，参数类型相同，使用return nil表示构造失败
struct Animal {
    let species: String
    init?(speci: String) {
        if speci.isEmpty {
            return nil
        }
        self.species = speci
    }
}
let one = Animal(speci: "")
let tw = Animal(speci: "33")
//构造出来的是一个可选值
if let t = tw {
    print(t.species)
}

//""表示的是有效的，是一个字符串，和值nil是两个不同的概念

//枚举类型可失败构造器：通过一个带一个或多个参数的可失败构造器来获取枚举类型中特定的枚举成员，如果提供的参数无法匹配任何枚举成员，则构造失败。
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil//利用该可失败构造器在三个枚举成员中获取一个相匹配的枚举成员，当参数的值不能与任何枚举成员相匹配时，则构造失败
        }
    }
}

//带原始值的枚举类型的可失败构造器：带原始值的枚举类型会自带一个可失败构造器init?(rawValue:)，该可失败构造器有一个名为rawValue的参数，其类型和枚举类型的原始值类型一致，如果该参数的值能够和某个枚举成员的原始值匹配，则该构造器会构造相应的枚举成员，否则构造失败。
enum TemperatureUni: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit = TemperatureUni(rawValue: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// 打印 "This is a defined temperature unit, so initialization succeeded."

let unknownUnit = TemperatureUni(rawValue: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
// 打印 "This is not a defined temperature unit, so initialization failed."

//构造失败的传递：类，枚举，结构体可失败构造器可以代理到其它可失败构造器，也能向上代理到父类可失败构造器。

//重写可失败构造器：你可以在子类中重写父类的可失败构造器。或者你也可以用子类的非可失败构造器重写一个父类的可失败构造器。这使你可以定义一个不会构造失败的子类，即使父类的构造器允许构造失败。

//可失败构造器init!:该可失败构造器将会构建一个对应类型的隐式解包可选类型的对象

//必要构造器：在类的构造器前添加required修饰符表明所有该类的子类都必须实现该构造器
class SomeClass {
    required init() {
        // 构造器的实现代码
    }
}

//在子类重写父类的必要构造器时，必须在子类的构造器前也添加required修饰符，表明该构造器要求也应用于继承链后面的子类。在重写父类中必要的指定构造器时，不需要添加override修饰符：

class SomeSubclass: SomeClass {
    required init() {//如果继承来的构造器已经满足要求，可以不提供实现
        // 构造器的实现代码
    }
}

//通过闭包或函数设置属性的默认值：如果某个存储型属性的默认值需要一些定制或设置，你可以使用闭包或全局函数为其提供定制的默认值。每当某个属性所在类型的新实例被创建时，对应的闭包或函数会被调用，而它们的返回值会当做默认值赋值给这个属性。

//这种类型的闭包或函数通常会创建一个跟属性类型相同的临时变量，然后修改它的值以满足预期的初始状态，最后返回这个临时变量，作为属性的默认值。

//下面介绍了如何用闭包为属性提供默认值：

//class SomeClass {
//    let someProperty: SomeType = {
//        // 在这个闭包中给 someProperty 创建一个默认值
//        // someValue 必须和 SomeType 类型相同
//        return someValue
//    }()
//}
//注意闭包结尾的大括号后面接了一对空的小括号。这用来告诉 Swift 立即执行此闭包。如果你忽略了这对括号，相当于将闭包本身作为值赋值给了属性，而不是将闭包的返回值赋值给属性。
//
//注意
//如果你使用闭包来初始化属性，请记住在闭包执行时，实例的其它部分都还没有初始化。这意味着你不能在闭包里访问其它属性，即使这些属性有默认值。同样，你也不能使用隐式的self属性，或者调用任何实例方法。
struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}
