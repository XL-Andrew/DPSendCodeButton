//
//  DPSendCodeButton.m
//  demo
//
//  Created by Andrew on 2017/8/15.
//  Copyright © 2017年 Andrew. All rights reserved.
//

#import "DPSendCodeButton.h"
#import "DPGCDTimer.h"

#define COUNTDOWN_TIME 60   //倒计时时长
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface DPSendCodeButton ()
{
    NSUInteger originalTime;
}

@property (nonatomic, strong) DPGCDTimer *countdownTimer;

@end

@implementation DPSendCodeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.enabled = YES;
        [self.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self addTarget:self action:@selector(startTiming) forControlEvents:UIControlEventTouchUpInside];
        
        //App进入前台
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(ApplicationBecomeActive)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
        //App进入后台
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(ApplicationEnterBackground)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        if ([self getSaveTime] > 1) {
            originalTime = [self getSaveTime];
            [self startTiming];
        } else {
            originalTime = COUNTDOWN_TIME;
        }
    }
    return self;
}

- (void)startTiming
{
    WS(weakSelf);
    self.enabled = NO;
    [self.countdownTimer timerWithTimeDuration:originalTime withRunBlock:^(NSUInteger currentTime) {
        NSLog(@"%ld",currentTime);
        [self saveTime:currentTime];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf setTitle:[NSString stringWithFormat:@"重新发送（%lds）",currentTime] forState:UIControlStateNormal];
        });
    }];
}

- (void)allowTimingAtBackgound:(BOOL)allow
{
    if (allow) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIApplicationDidBecomeActiveNotification
                                                      object:nil];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:UIApplicationDidEnterBackgroundNotification
                                                      object:nil];
    }
}

#pragma mark -  private

- (NSUInteger)getSaveTime
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:@"VerCodeButtonTime"] integerValue];
}

- (void)saveTime:(NSUInteger)ktime
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%ld",ktime] forKey:@"VerCodeButtonTime"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)ApplicationBecomeActive
{
    [self.countdownTimer resumeTimer];
}

- (void)ApplicationEnterBackground
{
    [self.countdownTimer suspendTimer];
}

- (DPGCDTimer *)countdownTimer
{
    if (!_countdownTimer) {
        WS(weakSelf);
        _countdownTimer = [[DPGCDTimer alloc] init];
        _countdownTimer.timerStopBlock = ^{
            originalTime = COUNTDOWN_TIME;
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.enabled = YES;
                [weakSelf setTitle:@"重新发送" forState:UIControlStateNormal];
            });
        };
    }
    return _countdownTimer;
}

@end
