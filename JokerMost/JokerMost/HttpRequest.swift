//
//  HttpRequest.swift
//  JokerMost
//
//  Created by pandazheng on 15/5/1.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import Foundation

class HttpRequest : NSObject
{
    override init()
    {
        super.init()
    }
    
    ///
    /// @brief 把二进制数据转换成JSON格式的数据
    /// @param data NSDictionary?类型，网络请求返回来的二进制数据
    /// @return 如果解析成功，返回NSDictionary?类型的JSON数据；如果解析失败，会返回nil
    ///
    class func parseJSONData(data: AnyObject?) -> NSDictionary?
    {
        if let downloadData : NSData = data as? NSData
        {
            var jsonData : AnyObject? = NSJSONSerialization.JSONObjectWithData(downloadData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
            
            return jsonData as? NSDictionary
        }
        
        //当解析失败时，会返回nil
        return nil
    }
    
    ///
    /// @brief 异步网络请求方法，需要请求地址参数及回调
    /// @param urlString 请求地址
    /// @param completion 请求完成或者请求失败的回调
    /// @return 请求成功时，会返回NSDictionary?的字典格式的数据，如果请求失败，会返回nil
    ///
    class func request(#urlString : String?,completion: (data: NSDictionary?) -> Void)
    {
        if urlString == nil
        {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                println("urlString 为空")
                //请求出现，则返回nil对象表示
                completion(data: nil)
            })
            return
        }
        
        let url = NSURL(string: urlString!)
        let request = NSURLRequest(URL: url!)
        
        let queue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            if error != nil
            {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    println(error)
                    //请求出现，则返回nil对象表示
                    completion(data: nil)
                })
            }
            else
            {
                //请求成功
                let parseData = self.parseJSONData(data)
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    completion(data: parseData)
                })
            }
        }
    }
}


