//
//  ViewController.swift
//  AsynDownloadNSURLConnection
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
//        let urlAsString = "http://www.baidu.com"
//        let url = NSURL(string: urlAsString)
//        let urlRequest = NSURLRequest(URL: url!)
//        
//        let queue = NSOperationQueue()
//        
//        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: queue) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
//            if data.length > 0 && error == nil
//            {
//                let html = NSString(data: data, encoding: NSUTF8StringEncoding)
//                println("html = \(html!)")
//            }
//            else if data.length == 0 && error == nil
//            {
//                println("Nothing was download")
//            }
//            else if error != nil
//            {
//                println("Error happened = \(error)")
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

import UIKit

extension NSURL
{
    class func documentsFolder() -> NSURL
    {
        let fileManager = NSFileManager()
        return fileManager.URLForDirectory(.DocumentDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: false
            , error: nil)!
    }
}

class ViewController : UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAsString = "http://www.baidu.com"
        let url = NSURL(string: urlAsString)
        let urlRequest = NSURLRequest(URL: url!)
        
        let queue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: queue
            ) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            if data.length > 0 && error == nil
            {
                let filePath = NSURL.documentsFolder().URLByAppendingPathComponent("baidu.html")
                
                if data.writeToURL(filePath, atomically: true)
                {
                    println("successfully saved the file to \(filePath)")
                }
                else
                {
                    println("failed to save to file to \(filePath)")
                }
            }
            else if data.length == 0 && error == nil
            {
                println("Nothing was download")
            }
            else if error != nil
            {
                println("Error happened = \(error)")
            }
        }
    }
}