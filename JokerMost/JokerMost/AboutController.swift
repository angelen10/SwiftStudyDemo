//
//  AboutController.swift
//  JokerMost
//
//  Created by pandazheng on 15/5/1.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class AboutController : UIViewController
{
    var controller : UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "关于作者"
        
    }

    
    @IBAction func onButtonClicked(sender: UIButton)
    {
        /*
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "http://pandazheng.blog.163.com")!)
        {
            UIApplication.sharedApplication().openURL(NSURL(string: "http://pandazheng.blog.163.com")!)
        }*/
        
        
        controller = UIAlertController(title: "Title", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
        
        let action = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default) { (paramAction:UIAlertAction!) -> Void in
            println("The Done button was tapped")
        }
        
        controller?.addAction(action)
        self.presentViewController(controller!, animated: true, completion: nil)
        
        println("button click......")
    }
}
