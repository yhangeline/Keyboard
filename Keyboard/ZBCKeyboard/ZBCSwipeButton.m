//
//  ZBCSwipeButton.m
//  test
//
//  Created by Zhubch on 15-2-11.
//  Copyright (c) 2015年 Zhubch. All rights reserved.
//

#import "ZBCSwipeButton.h"

@implementation ZBCSwipeButton
{
    NSMutableArray *labels;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(move:)];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:pan];
        [self addGestureRecognizer:tap];
        [self createLabel];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        self.backgroundColor = _color;
        self.textColor = _pressedColor;
        self.tintIndex = 5;
 
        [UIView animateWithDuration:1 animations:^{
            self.tintIndex = 0;
        }];
    } else {
        self.backgroundColor = _pressedColor;
        self.textColor = _color;
    }
}

- (void)move:(UIPanGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.backgroundColor = _pressedColor;
        self.textColor = _color;
    }
    if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        
        CGPoint v = [gesture velocityInView:self];
        
        if (v.x < 0 && v.y<0) {
            self.tintIndex = 1;
        }
        else if(v.x > 0 && v.y<0){
            self.tintIndex = 2;
        }
        else if(v.x < 0 && v.y>0){
            self.tintIndex = 3;
        }
        else if(v.x > 0 && v.y>0){
            self.tintIndex = 4;
        }
        
        self.backgroundColor = _color;
        self.textColor = _pressedColor;

        [UIView animateWithDuration:1 animations:^{
            self.tintIndex = 0;
        }];
    }
}

- (void)setKeys:(NSString *)keys
{
    _keys = keys;
    for (int i = 0; i < 5; i++) {
        NSString *key = [keys substringWithRange:NSMakeRange(i, 1)];
        UILabel *label = (UILabel*)[self viewWithTag:i+1];
        label.text = key;
    }
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    self.backgroundColor = color;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    for (int i = 0; i < 5; i++) {
        UILabel *label = (UILabel*)[self viewWithTag:i+1];
        label.textColor = textColor;
    }
}

- (void)setTintIndex:(int)tintIndex
{
    _tintIndex = tintIndex;
    
    if (tintIndex > 0) {
        [self.delegate choosedKey:[_keys substringWithRange:NSMakeRange(tintIndex - 1, 1)]];
    }
    
    for (UILabel *l in self.subviews) {
        if (l.tag == tintIndex) {
            l.textColor = _tintTextcolor;
        }else {
            l.textColor = _textColor;
        }
    }
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGFloat w = frame.size.width;
    CGFloat h = frame.size.height;
    
    [labels enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UILabel *l = obj;
        switch (idx) {
            case 0:
                l.frame = CGRectMake(0, 0, 20, 20);
                break;
            case 1:
                l.frame = CGRectMake(w-20, 0, 20, 20);
                break;
            case 2:
                l.frame = CGRectMake(0, h-20, 20, 20);
                break;
            case 3:
                l.frame = CGRectMake(w-20, h-20, 20, 20);
                break;
            case 4:
                l.frame = CGRectMake(w*0.5-10, h*0.5-10, 20, 20);
                break;
                
            default:
                break;
        }
    }];
}

- (void)createLabel
{
    labels = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
        UILabel *l = [[UILabel alloc]initWithFrame:CGRectZero];
        l.textAlignment = NSTextAlignmentCenter;
        l.font = [UIFont boldSystemFontOfSize:17];
        l.tag = i+1;
        [self addSubview:l];
        [labels addObject:l];
    }
}

@end
