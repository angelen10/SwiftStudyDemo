//
//  ViewController.swift
//  NSUserDefaultsDemo
//
//  Created by pandazheng on 15/5/18.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var textfields : UITextField?
    
    
    @IBAction func saveData(sender : UIButton)
    {
        var text = textfields?.text
        userDefaults.setObject(text, forKey: "textfield")
        userDefaults.synchronize()
    }
    
    @IBAction func loadData(sender : UIButton)
    {
        var text = userDefaults.stringForKey("textfield")
        textfields?.text = text
    }
    
    @IBAction func editExit(sender : UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func editEnd(sender : UIControl)
    {
        textfields?.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println(userDefaults)
        println(defaults)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

