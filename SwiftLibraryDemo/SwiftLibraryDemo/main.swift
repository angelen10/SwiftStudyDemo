//
//  main.swift
//  SwiftLibraryDemo
//
//  Created by pandazheng on 15/6/6.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import Foundation

assert(true)

println(assert(true))

count("foo") == 3

println(count("foo") == 3)


for (i,j) in enumerate(["A","B"])
{
    println("\(i):\(j)")
}

println(min(8,2,3))

println("hello")

println("World")



println(abs(-12))

var languages = ["Swift","Object-C"]
println(contains(languages, "Swift"))

println(dropFirst(languages))

var array = ["panda","zheng","wang","zheng"]

println(dropLast(array))
println(count(array))

array.append("jack")

println(array)

let arrObj : NSArray = ["aaa","bbb","ccc","ddd"]
let arr : [AnyObject] = arrObj as [AnyObject]




