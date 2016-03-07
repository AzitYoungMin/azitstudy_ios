//
//  WriteQuestionViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface WriteQuestionViewController : BaseViewController<UITextFieldDelegate, UITextViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UIView *_headerView;
    IBOutlet UITextField *_titleTextField;
    IBOutlet UITextView *_bodyTextView;
}

@end
