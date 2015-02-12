//
//  ViewController.m
//  Keyboard
//
//  Created by zhubch on 15-2-12.
//  Copyright (c) 2015年 zhubch. All rights reserved.
//

#import "ViewController.h"
#import "ZBCKeyBoard.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZBCKeyBoard *keyboard = [[ZBCKeyBoard alloc]init];
    keyboard.editView = _textView;
    keyboard.style = ZBCKeyBoardStyleColorfull;
//    keyboard.style = ZBCKeyBoardStyleFlat;
//    keyboard.style = ZBCKeyBoardStyleSimulate;

    keyboard.backgroundImage = [UIImage imageNamed:@"bg"];
    
    _textView.inputView = keyboard;
}

@end
