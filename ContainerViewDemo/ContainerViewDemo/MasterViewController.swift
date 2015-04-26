//
//  MasterViewController.swift
//  ContainerViewDemo
//
//  Created by pandazheng on 15/4/26.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

import UIKit

protocol MasterViewControllerDelegate
{
    func MasterViewControllerShowButtonDidClicked()
}

class MasterViewController : UIViewController
{
    var delegate : MasterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func respondsToShowButton(sender: UIBarButtonItem)
    {
        delegate?.MasterViewControllerShowButtonDidClicked()
    }
}
