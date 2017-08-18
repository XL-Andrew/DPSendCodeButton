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
 初始化方法

 @param frame frame
 @param identifyString 控件标识 用于解决多个界面使用此控件倒计时无法刷新问题。当不需要此区别时可以传nil
 @return instancetype
 */
- (instancetype)initWithFrame:(CGRect)frame identify:(NSString *)identifyString;

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
