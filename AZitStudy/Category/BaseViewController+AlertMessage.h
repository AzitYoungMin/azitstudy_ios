//
//  BaseViewController+AlertMessage.h
//  GangnamSister
//
//  Created by coanyaa on 2015. 10. 19..
//  Copyright © 2015년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController (AlertMessage)<UIAlertViewDelegate>

- (void)closeViewControllerAfterAlertMessage:(NSString*)message;

@end
