//
//  ViewController.swift
//  ReadWritePlistDemo
//
//  Created by pandazheng on 15/5/18.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

//设置GameData.plist的Key
let BedroomFloorKey = "BedroomFloor"
let BedroomWallKey = "BedroomWall"
let XInitializerItem = "XInitializerItem"

class ViewController: UIViewController {
    
    var bedroomFloorId : AnyObject = 101
    var bedroomWallId : AnyObject = 101
    var DoNotEventChangeMe : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadGameData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func loadGameData()
    {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("GameData.plist")
        
        let fileManager = NSFileManager.defaultManager()
        
        //检查plist文件是否存在
        if (!fileManager.fileExistsAtPath(path))
        {
            //如果不存在，就从Bundle拷贝一份
            if let bundlePath = NSBundle.mainBundle().pathForResource("GameData", ofType: "plist")
            {
                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                println("Bundle GameData.plist file is --> \(resultDictionary!.description)")
                
                fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
                println("copy")
            }
            else
            {
                println("GameData.plist not found. Please, make sure it is part of the bundle.")
            }
        }
        else
        {
            println("GameData.plist already exists at path.")
        }
        
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        println("Loaded GameData.plist file is --> \(resultDictionary!.description)")
        
        var myDict = NSDictionary(contentsOfFile: path)
        if let dict = myDict
        {
            bedroomFloorId = dict.objectForKey(BedroomFloorKey)!
            bedroomWallId = dict.objectForKey(BedroomWallKey)!
            DoNotEventChangeMe = dict.objectForKey(XInitializerItem) as? String
            println("bedroomFloorId = \(bedroomFloorId),bedroomWallId = \(bedroomWallId),DoNotEventChangeMe = \(DoNotEventChangeMe!)")
        }
        else
        {
            println("WARNING: Couldn't create dictionary from GameData.plist! Default values will be used!")
        }
    }
    
    @IBAction func saveButtonTapped(sender : UIButton)
    {
        //改变bedroomFloorId的值
        bedroomFloorId = 999
        //保存更改的值
        saveGameData()
    }
    
    func saveGameData()
    {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as! NSString
        let path = documentsDirectory.stringByAppendingPathComponent("GameData.plist")
        println("\(path)")
        
        var dict : NSMutableDictionary = ["XInitializerItem":"DoNotEventChangeMe"]
        
        //保存值
        dict.setObject(bedroomFloorId, forKey: BedroomFloorKey)
        dict.setObject(bedroomWallId, forKey: BedroomWallKey)
        
        //写入GameData.plist
        dict.writeToFile(path, atomically: false)
        
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        println("Save GameData.plist file is ---> \(resultDictionary!.description)")
    }
}

