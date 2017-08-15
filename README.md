* 效果图

![效果图.gif](http://upload-images.jianshu.io/upload_images/4842734-0011d6ed9ac1ead7.gif?imageMogr2/auto-orient/strip)

* 倒计时定时器  

使用的是GCD定时器  -- [GCD定时器](http://www.jianshu.com/p/23450f679fc2)

* 防止恶意点击

其中设置了倒计时时间记录，无论是pop销毁再重建，还是杀掉进程再启动程序，都会从之前的计时时间开始，除非之前的计时任务结束。

防止某些用户恶意操作，多触发发送验证码。

* 使用方法 

```
// 初始化
DPSendCodeButton *sendCodeButton = [[DPSendCodeButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];

//是否允许后台计时
[sendCodeButton allowTimingAtBackgound:NO];

//添加点击事件
[sendCodeButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];

[self.view addSubview: sendCodeButton];
```

__其他控件属性设置与UIButton相同__