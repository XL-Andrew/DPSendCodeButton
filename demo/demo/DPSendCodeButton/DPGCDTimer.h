//
//  DPGCDTimer.h
//  demo
//
//  Created by Andrew on 2017/8/15.
//  Copyright © 2017年 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TimerRunBlock)(NSUInteger currentTime);  //定时器计时回调
typedef void (^TimerStopBlock)();                       //定时器结束计时回调

@interface DPGCDTimer : NSObject

@property (nonatomic,assign)BOOL isTimerRuning;         //定时器是否正在运行
@property (nonatomic, copy) TimerStopBlock timerStopBlock;

/**
 *  定时器初始化(定时器默认开启)
 *
 *  @param timeDuration  时长
 *  @param timerRunBlock 定时器回调
 */
- (void)timerWithTimeDuration:(double)timeDuration withRunBlock:(TimerRunBlock)timerRunBlock;


/**
 *  定时器停止
 */
- (void)stopTimer;

/**
 *  定时器恢复
 */
- (void)resumeTimer;

/**
 *  定时器暂停
 */
- (void)suspendTimer;

@end
