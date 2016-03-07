//
//  StudentLeftMenuViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 23..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "PopupBaseViewController.h"

@interface StudentLeftMenuViewController : PopupBaseViewController<UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UIView *_profileView;
    IBOutlet UILabel *_nameLabel;
    IBOutlet UILabel *_userTypeLabel;
    IBOutlet UIButton *_profileImageButton;
    IBOutlet UILabel *_goalSchoolLabel;
    IBOutlet NSLayoutConstraint *_contentViewLeadingLayout;
    IBOutlet NSLayoutConstraint *_contentViewWidthLayout;
    IBOutlet UIButton *_profileArrowButton;
    IBOutlet UIView *_studentInfoView;
    IBOutlet UIView *_mentorInfoView;
    IBOutlet UIView *_mentorPointView;
    IBOutlet UILabel *_mentorPointLabel;
    IBOutlet UILabel *_mentorNameLabel;
    IBOutlet UILabel *_mentorCommentLabel;
    IBOutlet NSLayoutConstraint *_profileViewHeightLayout;
}

@end
