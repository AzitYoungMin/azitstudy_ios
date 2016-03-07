//
//  PopupDateTimeSelectViewController.h
//  GangnamSister
//
//  Created by coanyaa on 2015. 9. 30..
//  Copyright © 2015년 Joy2x. All rights reserved.
//

#import "PopupBaseViewController.h"

@interface PopupDateTimeSelectViewController : PopupBaseViewController{
    
    IBOutlet UIDatePicker *_datePicker;
    IBOutlet NSLayoutConstraint *_contentBottomLayout;
}

@property (strong, nonatomic) NSDate *minimumDate;
@property (strong, nonatomic) NSDate *startDate;
@property (readonly, nonatomic) NSDate *selectedDate;

@end
