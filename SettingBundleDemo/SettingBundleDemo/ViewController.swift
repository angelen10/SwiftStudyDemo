//
//  ViewController.swift
//  SettingBundleDemo
//
//  Created by pandazheng on 15/5/18.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadDefaults()
        getUserDefault()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //加载默认的应用设置
    func loadDefaults()
    {
        var settingBundle = NSBundle.mainBundle().pathForResource("Settings", ofType: "bundle")
        if settingBundle == nil
        {
            return
        }
        
        var root = NSDictionary(contentsOfFile: settingBundle!.stringByAppendingPathComponent("Root.plist"))
        var preferences = root?.objectForKey("PreferenceSpecifiers") as! Array<NSDictionary>
        var defaultsToRegister = NSMutableDictionary(capacity: root!.count)
        for preference in preferences
        {
            var key = preference.objectForKey("Key") as? String
            if key != nil
            {
                defaultsToRegister.setValue(preference.objectForKey("DefaultValue"), forKey: key!)
            }
        }
        
        NSUserDefaults.standardUserDefaults().registerDefaults(defaultsToRegister as [NSObject : AnyObject])
    }
    
    //获取应用设置
    func getUserDefault()
    {
        var defaults = NSUserDefaults.standardUserDefaults()
        var file = defaults.objectForKey("name_preference") as? String
        println(file!)
    }
    
    //更改系统设置
    func updateUserDefaults()
    {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(false, forKey: "enabled_preference")
        defaults.synchronize()
    }
}

