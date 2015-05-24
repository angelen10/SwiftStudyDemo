//
//  ViewController.swift
//  StoryBoardDemo
//
//  Created by pandazheng on 15/5/24.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //加载xib到storyboard
        let button = NSBundle.mainBundle().loadNibNamed("Button", owner: self, options: nil).first as! UIButton
        button.center = self.view.center
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GotoStoryboard()
    {
        //方法一
        let vc = UIStoryboard(name: "Second", bundle: nil).instantiateInitialViewController() as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        //方法二
//        let vc = UIStoryboard(name: "Second", bundle: nil).instantiateViewControllerWithIdentifier("Second") as! UIViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    //响应xib button事件
    @IBAction func centerButtonBeTapped(sender : AnyObject)
    {
        println("centerButtonBeTapped")
        let vc = UIStoryboard(name: "Second", bundle: nil).instantiateViewControllerWithIdentifier("Second") as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

