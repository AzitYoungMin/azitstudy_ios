//
//  ScoreBoardTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 29..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "ScoreBoardTableViewCell.h"
#import "ScoreBoardInfo.h"

@implementation ScoreBoardTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _baseView.layer.borderColor = [UIColor colorWithHex:0xebebeb].CGColor;
    _baseView.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setScoreInfo:(ScoreBoardInfo *)scoreInfo
{
    _scoreInfo = scoreInfo;
    _titleLabel.text = scoreInfo.title;
    
    for(NSInteger i=0; i < [_monthLabels count]; i++){
        UILabel *monthLabel = (UILabel*)[_monthLabels objectAtIndex:i];
        UILabel *averageLabel = (UILabel*)[_averageScoreLabels objectAtIndex:i];
        UILabel *originalLabel = (UILabel*)[_originalScoreLabels objectAtIndex:i];
        UILabel *gradeLabel = (UILabel*)[_gradeLabels objectAtIndex:i];
        
        NSString *month = [scoreInfo.monthArray objectAtIndex:i];
        NSNumber *averageValue = [scoreInfo.averageScoreArray objectAtIndex:i];
        NSNumber *originalValue = [scoreInfo.originalScoreArray objectAtIndex:i];
        NSNumber *gradeValue = [scoreInfo.gradeArray objectAtIndex:i];
        
        monthLabel.text = month;
        averageLabel.text = [averageValue stringValue];
        originalLabel.text = [originalValue stringValue];
        gradeLabel.text = [gradeValue stringValue];
    }
}
@end
