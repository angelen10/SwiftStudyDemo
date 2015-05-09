//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


let quotation = "we're a lot like,you and i"
let somequotation = "we're a lot like,you and i"
if quotation == somequotation
{
    println("equal")
}

let minValue = UInt8.min
let maxValue = UInt8.max


let min = Int32.min
let max = Int32.max


let dec = 17
let bin = 0b1001
let oct = 0o12
let hex = 0x10

1.25e2

1.25e-2


0xFp2
0xFp-2

let http404Error = (404,"Not Found")
let (statusCode,statusMessage) = http404Error

println("The status code is \(statusCode)")

var serverCode : Int? = 44
serverCode = nil

var surveryAnswer : String?

let possibleString : String? = "An optional string"
println(possibleString!)

let assumeString : String! = "hello world"
println(assumeString)


let age = -3
assert(age >= 0,"A person's age cannot be less than zero")

let contentHeight = 40
let hasHeader = true
var rowHeight = contentHeight
if hasHeader == true
{
    rowHeight = rowHeight + 50
}
else
{
    rowHeight = rowHeight + 20
}


for index in 1...5
{
    println("\(index) * 5 = \(index * 5)")
}

let names = ["Anna","Alex","Brian","Jack"]
let count = names.count
for i in 0...count
{
    println("第 \(i+1) 个人叫 \(names[i])")
}

for character in "Dog?!!!!!"
{
    println(character)
}





