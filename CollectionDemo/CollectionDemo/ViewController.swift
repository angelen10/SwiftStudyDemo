//
//  ViewController.swift
//  CollectionDemo
//
//  Created by pandazheng on 15/5/26.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    var Array = [String]()
    
    var ButtonArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Array = ["pandazheng","jackwang","wangzheng","pandazheng","jackwang","wangzheng","pandazheng","jackwang","wangzheng","pandazheng","jackwang","wangzheng"]
        
        ButtonArray = ["pandazheng","jackwang","wangzheng","pandazheng","jackwang","wangzheng","pandazheng","jackwang","wangzheng","pandazheng","jackwang","wangzheng"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Array.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        var label = cell.viewWithTag(1) as! UILabel
        label.text = Array[indexPath.row]
        
        var button = cell.viewWithTag(2) as! UIButton
        button.setTitle(ButtonArray[indexPath.row], forState: UIControlState.Normal)
        
        return cell
    }
    
}

