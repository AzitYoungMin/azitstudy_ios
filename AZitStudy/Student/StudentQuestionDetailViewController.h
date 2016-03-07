//
//  StudentQuestionDetailViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@class SolveListInfo;
@interface StudentQuestionDetailViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UIView *_commentView;
    IBOutlet UIButton *_commentButton;
    IBOutlet UITextField *_commentTextField;
    IBOutlet UILabel *_titleLabel;
    IBOutlet UILabel *_writerNameLabel;
    IBOutlet UILabel *_createDateLabel;
}

@property (strong, nonatomic) NSNumber *postId;

@end
