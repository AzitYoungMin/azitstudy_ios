//
//  ScheduleListTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 23..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SWTableViewCell.h>

@class ActivityInfo;
@interface ScheduleListTableViewCell : SWTableViewCell{
    BOOL isPaused;
}

@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *memoLabel;
@property (strong, nonatomic) IBOutlet UILabel *goalLabel;
@property (strong, nonatomic) IBOutlet UILabel *elapsedTimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;

@property (strong, nonatomic) ActivityInfo *activityInfo;

@end
