//: Playground - noun: a place where people can play

import UIKit

//类型转换可以判断实例的类型，也可以将实例看做是父类或者子类的实例

//is和as实现，提供了一种简单的方式去检查值类型或者转换他的类型

//可以用来检查是否实现了某个协议

//可以将类型转换用在类和子类的层次结构上，检查特定类实例的类型并且转换这个类实例的类型成为这个层次结构中的其它类型。
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
//swift能够推断出movie和song的共同父类，mediaitem
let arr = [Movie(name: "aa", director: "cc"),Song(name: "bb", artist: "dd")]
//虽然arr被推断为[mediaitem]类型，但是存储的依然是movie和song类型，如果迭代它，依次取出的是mediaitem，而不是movie和song，为了能够回到原本的类型，需要检查类型或者向下转换到他们的其它类型。

//检查类型：is来检查一个实例是否属于特定的子类型
arr.first! is Song
arr.first! is Movie

//向下转型：某类型的一个常量或者变量可能在幕后实际上属于一个子类，当确定时，可以向下转到它的子类型，用as?和as!

//由于向下转型有可能会失败，as?转成试图转换类型的可选值。as!强制向下转型。
arr.first! as? Movie
arr.first! as! Movie
arr.first! as? Song

//any和anyobject的类型转换
/*
 any:任何类型，包括函数类型，类类型等
 anyobject:表示任何类类型
 */
//any类型可以混合不同类型一起工作，包括函数类型和非类类型
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

//可以在switch表达式的case中使用is和as操作符来找出只知道是any或anyobject类型的常量或变量的具体类型
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

//any类型可以表示所有类型的值，包括可选类型。如果需要用any类承载可选值，可以使用as显示转换为any
let o: Int? = 3
things.append(o)//会有警告
things.append(o as Any)
