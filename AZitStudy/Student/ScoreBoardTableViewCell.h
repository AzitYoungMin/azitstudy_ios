//
//  ScoreBoardTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 29..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScoreBoardInfo;
@interface ScoreBoardTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *monthLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *averageScoreLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *originalScoreLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *gradeLabels;

@property (strong, nonatomic) ScoreBoardInfo *scoreInfo;

@end
