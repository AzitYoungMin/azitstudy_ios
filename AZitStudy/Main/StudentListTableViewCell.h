//
//  StudentListTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StudentInfo;
@interface StudentListTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *checkButton;
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *hasScoreLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *weekDayLabels;
@property (strong, nonatomic) IBOutlet UIView *hasScoreBaseView;

@property (strong, nonatomic) StudentInfo *studentInfo;

@end
