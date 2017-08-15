//
//  DPSendCodeButton.h
//  demo
//
//  Created by Andrew on 2017/8/15.
//  Copyright © 2017年 Andrew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPSendCodeButton : UIButton

/**
 倒计时开始
 */
- (void)startTiming;


/**
 后台时是否允许计时
 
 @param allow defualt is NO
 */
- (void)allowTimingAtBackgound:(BOOL)allow;

@end
