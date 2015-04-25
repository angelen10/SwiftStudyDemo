//
//  ViewController.swift
//  SerialAndDeserialJson
//
//  Created by pandazheng on 15/4/25.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        let dictionary : [NSString : AnyObject] =
//        [
//            "First Name" : "Anthony",
//            "Last Name"  : "Robbins",
//            "Age"        : 51,
//            "children"   : [
//                "Anthony's Son 1",
//                "Anthony's Daughter 1",
//                "Anthony's Son 2",
//                "Anthony's Son 3",
//                "Anthony's Daughter 2"
//            ],
//        ]
//        
//        var error : NSError?
//        
//        let jsonData = NSJSONSerialization.dataWithJSONObject(dictionary, options: NSJSONWritingOptions.PrettyPrinted, error: &error)
//        
//        if let data = jsonData
//        {
//            if data.length > 0 && error == nil
//            {
//                println("successfully serialized the dictionary into data \(jsonData!)")
//            }
//            else if data.length == 0 && error == nil
//            {
//                println("No data was returned after serialization")
//            }
//            else if error != nil
//            {
//                println("An error happened = \(error)")
//            }
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}


//import UIKit
//
//class ViewController : UIViewController
//{
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let dictionary : [NSString : AnyObject] =
//        [
//            "First Name" : "Anthony",
//            "Last Name"  : "Robbins",
//            "Age"        : 51,
//            "children"   : [
//                "Anthony's Son 1",
//                "Anthony's Daughter 1",
//                "Anthony's Son 2",
//                "Anthony's Son 3",
//                "Anthony's Daughter 2"
//            ],
//        ]
//        
//        var error : NSError?
//        
//        let jsonData = NSJSONSerialization.dataWithJSONObject(dictionary, options: NSJSONWritingOptions.PrettyPrinted, error: &error)
//        
//        if let data = jsonData
//        {
//            if data.length > 0 && error == nil
//            {
//                println("successfully serialized the dictionary into data")
//                
//                let jsonString = NSString(data: data, encoding: NSUTF8StringEncoding)
//                println("JSON String = \(jsonString!)")
//            }
//            else if data.length == 0 && error == nil
//            {
//                println("No data was returned after serialization")
//            }
//            else if error != nil
//            {
//                println("An error happened = \(error)")
//            }
//        }
//    }
//}

import UIKit

class ViewController : UIViewController
{
    func retrieveJsonFromData(data : NSData)
    {
        var error : NSError?
        
        let jsonObject : AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &error)
        
        if error == nil
        {
            println("successfully deserialized...")
            
            if jsonObject is NSDictionary
            {
                let deserializedDictionary = jsonObject as! NSDictionary
                println("Deserialized JSON Dictionary =\(deserializedDictionary)")
            }
            else if jsonObject is NSArray
            {
                let deserializedArray = jsonObject as! NSArray
                println("Deserialized JSON Array = \(deserializedArray)")
            }
            else
            {
                
            }
        }
        else if error != nil
        {
            println("An error happened while deserializing the JSON data")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dictionary : [NSString : AnyObject] =
        [
            "First Name" : "Anthony",
            "Last Name"  : "Robbins",
            "Age"        : 51,
            "children"   : [
                "Anthony's Son 1",
                "Anthony's Daughter 1",
                "Anthony's Son 2",
                "Anthony's Son 3",
                "Anthony's Daughter 2"
            ],
        ]
        
        let arr : [String] = ["panda","zheng","jack","wang"]
        
        var error : NSError?
        
        //let jsonData = NSJSONSerialization.dataWithJSONObject(dictionary, options: NSJSONWritingOptions.PrettyPrinted, error: &error)
        let jsonData = NSJSONSerialization.dataWithJSONObject(arr, options: NSJSONWritingOptions.PrettyPrinted, error: &error)
        
        if let data = jsonData
        {
            if data.length > 0 && error == nil
            {
                println("successfully serialized the dictionary into data")
                
                retrieveJsonFromData(data)
            }
            else if data.length == 0 && error == nil
            {
                println("No data was returned after serialization")
            }
            else if error != nil
            {
                println("An error happened =\(error)")
            }
        }
    }
}
