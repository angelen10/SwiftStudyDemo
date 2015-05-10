//: Playground - noun: a place where people can play

import UIKit


var str = "Hello, playground"

let formatter = NSDateFormatter()
formatter.locale = NSLocale.currentLocale()
formatter.dateFormat = "MM/dd/yyyy"

var newFormatter = NSDateFormatter()

for index in 1...3
{
    println(index)
}

func sayHello()
{
    println("hello")
}

func sayHello(name : String)
{
    println("name is \(name)",name)
}

sayHello()

sayHello("pandazheng")

func sum(a:Int,b:Int) -> (suma:Int,sumb:Int)
{
    var suma = a;
    var sumb = b;
    return (sumb,suma)
}

var sumdemo = sum(12,13)
sumdemo.suma
sumdemo.sumb

struct GeoPoint
{
    var latitude = 0.0
    var longitude = 0.0
}

var newGeoPoint = GeoPoint()
newGeoPoint.latitude = 1.0
newGeoPoint.longitude = 1.5

struct Point
{
    var x:Int,y:Int
}

struct Size
{
    var width:Int,height:Int
}

struct Rect
{
    var orign:Point,size:Size
    
    func center() -> Point
    {
        var x = orign.x + (size.width) / 2
        var y = orign.y + (size.height / 2)
        return Point(x: x, y: y)
    }
}

class Person
{
    let name: String
    var age :Int
    var nickname : String?
    
    init(name: String,age :Int,nickname : String? = nil)
    {
        self.name = name
        self.age = age
        self.nickname = nickname
    }
}

var personOne = Person(name: "John", age: 26)
var personTwo = Person(name: "Fred", age: 20, nickname: "T-Bone")

class Mutant : Person
{
    var level : Int
    var superPower : String
    
    init(name:String,age:Int,level:Int,superPower:String,nickname:String? = nil)
    {
        self.level = level
        self.superPower = superPower
        super.init(name: name, age: age, nickname: nickname)
    }
    
    func isMorePowerful(mutant:Mutant) -> Bool
    {
        return (level > mutant.level)
    }
}

var jim = Mutant(name: "Jim", age: 23, level: 7, superPower: "Flight", nickname: "Flyin")
var jant = Mutant(name: "Jant", age: 24, level: 8, superPower: "Telepath", nickname: "Braiac")

jant.isMorePowerful(jim)

class SomeClass
{
    class func typeMethod(#string:String) -> String
    {
        return string + "_ModifiedInClassMethod"
    }
}

var strToModify : String = "Happy String"
SomeClass.typeMethod(string: strToModify)

class SimpleClass
{
    var rect:CGRect = CGRect(x: 0.0, y: 0.0, width: 100, height: 100)
    
}

var newSimpleClass = SimpleClass()
newSimpleClass.rect.size.width = 200

println(newSimpleClass.rect.size.width)




