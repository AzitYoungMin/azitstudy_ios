//
//  UIViewController+ToastMessage.m
//  dingdong
//
//  Created by coanyaa on 2015. 6. 14..
//  Copyright (c) 2015년 Timesystem. All rights reserved.
//

#import "UIViewController+ToastMessage.h"
#import <UIView+Toast.h>

@implementation UIViewController (ToastMessage)
- (void)showToastMessage:(NSString*)messgae
{
    [self.view makeToast:messgae];
}

- (void)showToastMessage:(NSString *)messgae duration:(NSTimeInterval)duration
{
    [self.view makeToast:messgae duration:duration position:CSToastPositionBottom];
}

@end
