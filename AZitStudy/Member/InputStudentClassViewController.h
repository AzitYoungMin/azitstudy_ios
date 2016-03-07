//
//  InputStudentClassViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@class RegisterMemberStudent;
@interface InputStudentClassViewController : BaseViewController{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UIView *_headerView;
    IBOutlet UIView *_footerView;
    IBOutletCollection(UIButton) NSArray *_tabButtons;
    IBOutletCollection(UIButton) NSArray *_mathTypeButtons;
}

@property (strong, nonatomic) RegisterMemberStudent *memberInfo;

@end
