//
//  ViewController.m
//  demo
//
//  Created by Andrew on 2017/8/15.
//  Copyright © 2017年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "DPSendCodeButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DPSendCodeButton *sendCodeButton = [[DPSendCodeButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    sendCodeButton.backgroundColor = [UIColor redColor];
    [sendCodeButton addTarget:sendCodeButton action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendCodeButton];
}

- (void)click
{
    //当开始计时 && 计时没有结束时，按钮点击无效。不用担心计时中多次点击。
    NSLog(@"发送请求验证码的网络请求");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
