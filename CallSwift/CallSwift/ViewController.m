//
//  ViewController.m
//  CallSwift
//
//  Created by pandazheng on 15/5/9.
//  Copyright (c) 2015年 pandazheng. All rights reserved.
//

#import "ViewController.h"
#import "CallSwift-swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    SwiftHello *h = [[SwiftHello alloc] init];
    [h sayHello];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
