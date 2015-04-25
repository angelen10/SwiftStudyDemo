//: Playground - noun: a place where people can play

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


