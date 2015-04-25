//
//  ViewController.swift
//  NSURLSessionBackground
//
//  Created by pandazheng on 15/4/25.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

extension NSURLSessionTask
{
    func start()
    {
        self.resume()
    }
}

class ViewController: UIViewController , NSURLSessionDelegate , NSURLSessionDownloadDelegate , NSURLSessionTaskDelegate{

    var session : NSURLSession!
    
    var configurationIdentifier : String
    {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let key = "configurationIdentifier"
        let previousValue = userDefaults.stringForKey(key) as String?
        
        if let thePreviousValue = previousValue
        {
            return previousValue
        }
        else
        {
            let newValue = NSDate().description
            userDefaults.setObject(newValue, forKey: key)
            userDefaults.synchronize()
            return newValue
        }
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        println("Received data")
    }
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        println("Finished writing the download content to URL = \(location)")
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        println("Finished")
        
        if error == nil
        {
            displayAlertWithTitle(title: "Alert", message: "Finish")
            println("without an error")
        }
        else
        {
            displayAlertWithTitle(title: "Error", message: "Download Failed")
            println("with an error = \(error)")
        }
        
        session.finishTasksAndInvalidate()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let configuration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier(configurationIdentifier)
        
        configuration.timeoutIntervalForRequest = 15.0
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue:nil)
    }
    
    func displayAlertWithTitle(title : String, message : String)
    {
        let controller = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.nasa.gov/sites/default/files/styles/1600x1200_autoletterbox/public/pia17474_1.jpg")
        
        let task = session.downloadTaskWithURL(url!)
        
        task.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

