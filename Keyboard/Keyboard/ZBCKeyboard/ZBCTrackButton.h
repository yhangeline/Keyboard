//
//  ZBCTrackButton.h
//  test
//
//  Created by zhubch on 15-2-11.
//  Copyright (c) 2015年 zhubch. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZBCTrackButton <NSObject>

- (void)trackedWithX:(CGFloat)x AndY:(CGFloat)y;

- (void)trackStarted;

@end

/**
 *  模拟Thinkpad的小红帽功能。可以通过触摸改变UITextView的光标位置
 */
@interface ZBCTrackButton : UIView

@property (nonatomic,assign) id<ZBCTrackButton> delegate;

@property (nonatomic,strong) UIColor *color;

@property (nonatomic,strong) UIColor *pressedColor;

@end
