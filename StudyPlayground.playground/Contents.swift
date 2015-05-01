//: Playground - noun: a place where people can play

import UIKit

println("hello world")

let label = "The Width is   "
let width = 20
let widthLabel = label + String(width)

var myVar = 1.52
myVar = 2.4
let myConstant = 42

let doubleValue : Double = 2.32
println("double is \(doubleValue)")

var shoppingList = ["catfish","water","tulips","blue"]

shoppingList[1] = "panda"

println(shoppingList)


var occ = [
    "Panda" : "Zheng",
    "Jack"  : "Wang",
]

occ["hello"] = "world"

let emptyArray = [String]()
let emptyDictionary = Dictionary<String,Int>()

let inArray = [75,43,103,37,12]
var teamScore = 0
for score in inArray
{
    if score > 50
    {
        teamScore += 3
    }
    else
    {
        teamScore += 1
    }
}

var optionString : String? = "hello"

var optionName : String? = "John Apple"
var gretting = "Hello"
if let name = optionName
{
    gretting = "hello,\(name)"
}

let vegetable = "red"

switch vegetable
{
    case "red":
        let vegetablecomment = "add some"
    case "green","blue":
        let vegetablecomment = "make a good"
    default:
        let vegetablecomment = "everything"
}

let intNumber = [
    "Prime" : [2,3,4,5,6],
    "Fib" : [1,1,2,3,5,8],
    "Square" : [1,4,9,16,25],
]

var largest = 0

for (kind,numbers) in intNumber
{
    for number in numbers
    {
        if number > largest
        {
            largest = number
        }
    }
}

println(largest)

var n = 2
while n < 100
{
    n = n * 2
}
n

var m = 2
do
{
    m = m * 2
} while m  < 100

m

var firstForLoop = 0
for i in 0...3
{
    firstForLoop += i
}
firstForLoop


var secondForLoop = 0
for var i = 0 ; i < 3 ; i++
{
    secondForLoop += i
}
secondForLoop


func greet(name: String,day : String) -> String
{
    return "Hello \(name) ,today is \(day)"
}

greet("bob","tuesday")


func sumOf(numbers : Int...) -> Int
{
    var sum = 0
    for number in numbers
    {
        sum += number
    }
    
    return sum
}

sumOf()
sumOf(42,159,12)

func returnFifteen() -> Int
{
    var y = 10
    func add()
    {
        y += 5
    }
    add()
    return y
}


returnFifteen()


func makeIncrementer() -> (Int -> Int)
{
    func addOne(number : Int) -> Int
    {
        return number + 1
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)


func hasAnyMatches(list : [Int], condition: Int -> Bool) -> Bool
{
    for item in list
    {
        if condition(item)
        {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool
{
    return number < 10
}

var numbers = [20,19,7,12]
hasAnyMatches(numbers, lessThanTen)



numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

numbers.map ({number in 3 * number })

class Shape
{
    var numberOfSides = 0
    func simpleDescription() -> String
    {
        return "A shape with \(numberOfSides) sides"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


class NameShape
{
    var numberOfSides : Int = 0
    var name : String
    
    init(name : String)
    {
        self.name = name
    }
    
    func simpleDescription() -> String
    {
        return "A shape with \(numberOfSides) sides"
    }
}

class Square : NameShape
{
    var sideLength : Double
    
    init(sideLength : Double , name: String)
    {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double
    {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()



class Equil : NameShape
{
    var sideLength : Double = 0.0
    
    init(sideLength : Double,name : String)
    {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter : Double
    {
        get
        {
            return 3.0 * sideLength
        }
        
        set
        {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equil triagle with side of length \(sideLength)"
    }
}

var triangle = Equil(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.perimeter
triangle.sideLength
triangle.simpleDescription()

enum Rank : Int
{
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDescription() -> String
    {
        switch self
        {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit
{
    case Spades,Hearts,Diamonds,Clubs
    func simpleDescription() -> String
    {
        switch self
        {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

struct Card
{
    var rank : Rank
    var suit : Suit
    
    func simpleDescription() -> String
    {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


protocol ExampleProtocol
{
    var simpleDescription : String {get}
    mutating func adjust()
}

class SimpleClass : ExampleProtocol
{
    var simpleDescription : String = "A very simple class"
    var anotherProperty : Int = 69105
    func adjust() {
        simpleDescription += "Now 100% adjusted"
    }
}

var a = SimpleClass()
a.adjust()

struct SimpleStruct : ExampleProtocol
{
    var simpleDescription : String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}

var b = SimpleStruct()
b.adjust()
let bDescription = b.simpleDescription

extension Int : ExampleProtocol
{
    var simpleDescription : String
    {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

7.simpleDescription

class Person
{
    var Name : String = "Initial Name"
    
    init()
    {
        self.sayChesses()
        println("New person initialized")
    }
    
    func sayChesses()
    {
        println("Cheese")
    }

}

var per = Person()
per.Name = "Alice"
per.sayChesses()

var secondperson = Person()
secondperson.Name = "Bob"

var Inta = 10
var Intb = 15
var total = Inta + Intb

class Animal
{
    var Name:String = "dog"
    
    init()
    {
        
    }
    
    func Walk()
    {
        println("dog is walk")
    }
}

class cat : Animal
{
    var CatName : String = "tom"
    
    override init()
    {
        super.init()
        super.Name = "cattom"
    }
    
    func fly()
    {
        println("I cann't fly")
    }
    
    override func Walk()
    {
        println("cat is walk")
        
        super.Walk()
    }
}


var catDemo = cat()
catDemo.Walk()
catDemo.fly()

var randnumber = arc4random_uniform(13)
var strnumber : String = String(format: "card%d", randnumber)

println(strnumber)

var mySecondArray : [Int] = [Int]()
mySecondArray.append(3)

mySecondArray.count

var myArray : [String] = ["hello","world","jack"]
myArray.count
myArray[0] = "wang"

myArray.insert("zheng", atIndex: 3)

myArray.count

class SwiftMath
{
    var name:String?
    
    init(name : String)
    {
        self.name = name
        
        println(self.name)
    }
    
    func sum(num1: Int,num2: Int) -> Int
    {
        return num1 + num2
    }
    
    func mul(num1: Int,num2: Int) -> Int
    {
        return num1 * num2
    }
}

var sm = SwiftMath(name: "pandazheng")
sm.name = "panda"
sm.sum(1,num2: 2)
sm.mul(2,num2: 3)

sm.sum(10 , num2: 24)
sm.mul(8, num2: 3)












