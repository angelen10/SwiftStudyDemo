//
//  ViewController.swift
//  SynDownloadNSURLConnection
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
//        println("We are here")
//        
//        let urlAsString = "http://www.baidu.com"
//        let url = NSURL(string: urlAsString)
//        
//        let urlRequest = NSURLRequest(URL: url!)
//        
//        var response : NSURLResponse?
//        var error : NSError?
//        
//        println("Firing synchronous url connection......")
//        
//        let data = NSURLConnection.sendSynchronousRequest(urlRequest, returningResponse: &response, error: &error)
//        
//        if data != nil && error == nil
//        {
//            println("\(data!.length) bytes of data was returned")
//        }
//        else if data?.length == 0 && error == nil
//        {
//            println("No data was returned")
//        }
//        else if error != nil
//        {
//            println("Error happened = \(error)")
//        }
//        
//        println("We are done")
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

class ViewController : UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("We are here...")
        
        let urlAsString = "http://www.baidu.com"
        let url = NSURL(string: urlAsString)
        
        let urlRequest = NSURLRequest(URL: url!)
        
        
        var response : NSURLResponse?
        var error : NSError?
        
        println("Firing synchronous url connection......")
        
        let dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(dispatchQueue, { () -> Void in
            let data = NSURLConnection.sendSynchronousRequest(urlRequest, returningResponse: &response, error: &error)
            
            if data != nil && error == nil
            {
                println("\(data!.length) bytes of data was returned")
            }
            else if data?.length == 0 && error == nil
            {
                println("No data was returned")
            }
            else if error != nil
            {
                println("Error happened = \(error)")
            }
        })
        
        println("We are done")
    }
}

