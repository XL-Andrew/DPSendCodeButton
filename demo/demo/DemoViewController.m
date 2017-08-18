//
//  DemoViewController.m
//  demo
//
//  Created by Andrew on 2017/8/18.
//  Copyright © 2017年 Andrew. All rights reserved.
//

#import "DemoViewController.h"
#import "DPSendCodeButton.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    DPSendCodeButton *sendCodeButton = [[DPSendCodeButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100) identify:@"first"];
    sendCodeButton.backgroundColor = [UIColor redColor];
    [sendCodeButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendCodeButton];
    
    DPSendCodeButton *sendCodeButton2 = [[DPSendCodeButton alloc]initWithFrame:CGRectMake(100, 250, 100, 100) identify:nil];
    sendCodeButton2.backgroundColor = [UIColor greenColor];
    [sendCodeButton2 addTarget:self action:@selector(click2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendCodeButton2];
}

- (void)click
{
    //当开始计时 && 计时没有结束时，按钮点击无效。不用担心计时中多次点击。
    NSLog(@"发送请求验证码的网络请求");
}

- (void)click2
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
