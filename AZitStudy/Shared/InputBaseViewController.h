//
//  InputBaseViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface InputBaseViewController : BaseViewController<UITextFieldDelegate>{
    
}

@property (assign, nonatomic) CGRect keyboardFrame;
@property (assign, nonatomic) NSTimeInterval keyboardAnimationDuration;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *inputFields;

- (IBAction)resignAllAction;

@end
