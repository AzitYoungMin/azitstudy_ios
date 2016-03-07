//
//  SolveListTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SolveListInfo;
@interface SolveListTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *replyCountLabel;
@property (strong, nonatomic) IBOutlet UIImageView *attachImageView;
@property (strong, nonatomic) IBOutlet UILabel *contentsLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateTimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *statusButton;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageHeightLayout;

@property (strong, nonatomic) SolveListInfo *solveInfo;

@end
