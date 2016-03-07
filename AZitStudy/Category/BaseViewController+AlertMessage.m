//
//  BaseViewController+AlertMessage.m
//  GangnamSister
//
//  Created by coanyaa on 2015. 10. 19..
//  Copyright © 2015년 Joy2x. All rights reserved.
//

#import "BaseViewController+AlertMessage.h"

#define ALERTTAG_CLOSEAFTER             999999

@implementation BaseViewController (AlertMessage)

- (void)closeViewControllerAfterAlertMessage:(NSString*)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"확인" otherButtonTitles:nil];
    alertView.tag = ALERTTAG_CLOSEAFTER;
    [alertView show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if( alertView.tag == ALERTTAG_CLOSEAFTER ){
        if( self.navigationController )
            [self backAction:nil];
        else
            [self closeAction:nil];
    }
}

@end
