//
//  ViewController.m
//  BigApp
//
//  Created by LTX on 2017/7/5.
//  Copyright © 2017年 LTX. All rights reserved.
//

#import "ViewController.h"

#import "TXBaseRequest.h"
#import "TXTimeHelper.h"

//#import "UIImageView+WebCache.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    self.view.backgroundColor = TXRandomColor;

    
    NSLog(@"时间：%@", [TXTimeHelper getHelloStringByLocalTime]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
