//
//  ViewController.swift
//  CallOC
//
//  Created by pandazheng on 15/5/9.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var h = OCHello()
        h.sayHello()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

