//
//  WeeklyCompareTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeeklyCompareTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UIView *graphBaseView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *leftLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lastWeekScoreLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *currentWeekScoreLabels;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *lastWeekViews;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *currentWeekViews;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *lastWeekHeightLayouts;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *currentWeekHeightLayouts;
@property (strong, nonatomic) IBOutlet UIView *lastWeekBaseView;
@property (strong, nonatomic) IBOutlet UIView *currentWeekBaseView;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;

- (void)setLastWeekValues:(NSArray*)values;
- (void)setCurrentWeekValues:(NSArray*)values;

@end
