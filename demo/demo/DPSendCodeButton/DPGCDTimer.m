//
//  DPGCDTimer.m
//  demo
//
//  Created by Andrew on 2017/8/15.
//  Copyright © 2017年 Andrew. All rights reserved.
//

#import "DPGCDTimer.h"

@interface DPGCDTimer ()
{
    dispatch_source_t timer;
}

@property (nonatomic,copy)TimerRunBlock timerRunBlock;

@end

@implementation DPGCDTimer

- (void)timerWithTimeDuration:(double)timeDuration withRunBlock:(TimerRunBlock)timerRunBlock
{
    if (!timer) {
        //创建定时器
        _isTimerRuning = YES;
        NSUInteger __block time = timeDuration;
        
        self.timerRunBlock = timerRunBlock;
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
        dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),1 * NSEC_PER_SEC, 0); //每秒执行
        dispatch_source_set_event_handler(timer, ^{
            if (self.timerRunBlock) {
                if (time <= 0) {
                    [self stopTimer];
                } else {
                    self.timerRunBlock(time --);
                }
            }
        });
        dispatch_resume(timer);
    }
    
}

//停止
- (void)stopTimer
{
    if(timer){
        if (_isTimerRuning) {
            dispatch_source_cancel(timer);
            timer = nil;
            _isTimerRuning = NO;
            if (self.timerStopBlock) {
                self.timerStopBlock();
            }
        }
        
    }
}

//恢复
- (void)resumeTimer
{
    if(timer){
        if (!_isTimerRuning) {
            dispatch_resume(timer);
            _isTimerRuning = YES;
        }
        
    }
}

//暂停
- (void)suspendTimer
{
    if(timer){
        if (_isTimerRuning) {
            dispatch_suspend(timer);
            _isTimerRuning = NO;
        }
    }
}

@end
