//
//  TableVC.swift
//  CustomVC
//
//  Created by pandazheng on 15/5/26.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import Foundation
import UIKit

class TableVC : UITableViewController {
    
    var Array = [String]()
    
    override func viewDidLoad() {
        Array = ["pandazheng","jackwang","pandazhengzheng"]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = Array[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count
    }
}