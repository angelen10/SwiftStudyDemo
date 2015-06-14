//
//  ViewController.swift
//  StudyDemo
//
//  Created by pandazheng on 15/6/9.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let systemName = UIDevice.currentDevice().systemName
        let systemVersion = UIDevice.currentDevice().systemVersion
        let name = UIDevice.currentDevice().name
        let identifierForVendor = UIDevice.currentDevice().identifierForVendor
        println("systemName = \(systemName),systemVersion = \(systemVersion),name = \(name),identifierForVendor = \(identifierForVendor)")
        let userInterfaceIdiom = UIDevice.currentDevice().userInterfaceIdiom
        println("userInterfaceIdiom = \(userInterfaceIdiom)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

