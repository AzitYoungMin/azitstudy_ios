//
//  StudyGraphMainViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@class CircleProgressView;
@interface StudyGraphMainViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>{
    NSTimeInterval myStudyTime;
    NSTimeInterval topTenStudyTime;
    NSTimeInterval dailyGoalTime;
    
    IBOutlet UITableView *_tableView;
    IBOutlet UIView *_footerView;
    IBOutlet CircleProgressView *_circleGraphView;
    IBOutlet UILabel *_elapsedTimeLabel;
    IBOutlet UILabel *_goalTimeLabel;
    IBOutlet UIButton *_goalSettingButton;
    IBOutlet UIView *_headerView;
    IBOutlet NSLayoutConstraint *_myTimeGraphTrailingLayout;
    IBOutlet NSLayoutConstraint *_topTenGraphTrailingLayout;
    IBOutlet NSLayoutConstraint *_difGraphTrailingLayout;
    IBOutlet UIView *_myTimeGraphBaseView;
    IBOutlet UIView *_topTenGraphBaseView;
    IBOutlet UIView *_difTimeGraphBaseView;
    IBOutlet UILabel *_myStudyTimeLabel;
    IBOutlet UILabel *_topTenStudyTimeLabel;
    IBOutlet UILabel *_difTimeLabel;
}

@property (assign, nonatomic) BOOL isShowDetailButton;

@end
