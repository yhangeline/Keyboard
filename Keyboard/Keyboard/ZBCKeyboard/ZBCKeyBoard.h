//
//  ZBCKeyBoard.h
//  test
//
//  Created by zhubch on 15-2-10.
//  Copyright (c) 2015年 zhubch. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ZBCKeyBoardStyleFlat,//扁平
    ZBCKeyBoardStyleColorfull,//炫彩
    ZBCKeyBoardStyleSimulate//仿真
} ZBCKeyBoardStyle;

static const NSUInteger ZBCKeyBoardStyleDefault = ZBCKeyBoardStyleFlat;

/**
 *  屎上最牛逼键盘，目前没有之一
 */
@interface ZBCKeyBoard : UIView

@property (nonatomic,assign) id<UIKeyInput> editView;

@property (nonatomic,assign) ZBCKeyBoardStyle style;

@property (nonatomic,strong) UIImage *backgroundImage;//炫彩风格才有效

@end
