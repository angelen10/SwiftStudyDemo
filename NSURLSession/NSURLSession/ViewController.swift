//
//  ViewController.swift
//  NSURLSession
//
//  Created by pandazheng on 15/4/25.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

//import UIKit
//
//class ViewController: UIViewController , NSURLSessionDelegate{
//
//    var session : NSURLSession!
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
//        configuration.timeoutIntervalForRequest = 15.0
//        
//        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        let url = NSURL(string: "http://www.nasa.gov/sites/default/files/styles/1600x1200_autoletterbox/public/pia17474_1.jpg")
//        
//        let task = session.dataTaskWithURL(url!, completionHandler: { (data:NSData!, response:NSURLResponse!, error:NSError!) -> Void in
//            println("Done")
//            
//            self.session.finishTasksAndInvalidate()
//        })
//        
//        task.resume()
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
//extension NSURLSessionTask
//{
//    func start()
//    {
//        self.resume()
//    }
//}
//
//class ViewController : UIViewController , NSURLSessionDelegate
//{
//    var session : NSURLSession!
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
//        configuration.timeoutIntervalForRequest = 15.0
//        
//        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
//        
//    }
//    
//    func displayAlertWithTitle(title: String , message : String)
//    {
//        let controller = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
//        controller.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//        
//        presentViewController(controller, animated: true, completion: nil)
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        let url = NSURL(string: "http://www.nasa.gov/sites/default/files/styles/1600x1200_autoletterbox/public/pia17474_1.jpg")
//        
//        let task = session.downloadTaskWithURL(url!, completionHandler: { [weak self](url:NSURL!, response:NSURLResponse!, error:NSError!) -> Void in
//            if error == nil
//            {
//                let manager = NSFileManager()
//                
//                var error : NSError?
//                var destinationPath = manager.URLForDirectory(.CachesDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: url, create: true, error: &error)!
//                let componentsOfUrl = url.absoluteString!.componentsSeparatedByString("/")
//                let fileNameFromUrl = componentsOfUrl[componentsOfUrl.count - 1]
//                destinationPath = destinationPath.URLByAppendingPathComponent(fileNameFromUrl)
//                manager.moveItemAtURL(url, toURL: destinationPath, error: nil)
//                
//                let message = "Saved the download data to = \(destinationPath)"
//                
//                self!.displayAlertWithTitle("Success", message: message)
//            }
//            else
//            {
//                self!.displayAlertWithTitle("Error", message: "Could not download the data. An error occurred")
//            }
//        })
//        
//        task.start()
//    }
//}

import UIKit

extension NSURLSessionTask
{
    func start()
    {
        self.resume()
    }
}

class ViewController : UIViewController , NSURLSessionDelegate , NSURLSessionDataDelegate
{
    var session : NSURLSession!
    
    var mutableData : NSMutableData = NSMutableData()
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        data.enumerateByteRangesUsingBlock { (pointer : UnsafePointer<()>, range:NSRange, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
            let newData = NSData(bytes: pointer, length: range.length)
            self.mutableData.appendData(newData)
        }
    }
    
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        session.finishTasksAndInvalidate()
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            var message = "Finished downloading your content"
            
            if error != nil
            {
                message = "Failed to download your content"
            }
            
            self.displayAlertWithTitle("Done", message: message)
        })
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 15.0
        
        session = NSURLSession(configuration: configuration,delegate: self , delegateQueue: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.nasa.gov/sites/default/files/styles/1600x1200_autoletterbox/public/pia17474_1.jpg")
        
        let task = session.dataTaskWithURL(url!,completionHandler: nil)
        
        task.start()
    }
    
    func displayAlertWithTitle(title: String,message: String)
    {
        let controller = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(controller, animated: true, completion: nil)
    }
}

