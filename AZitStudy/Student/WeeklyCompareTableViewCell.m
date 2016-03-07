//
//  WeeklyCompareTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "WeeklyCompareTableViewCell.h"
#import "StackBarChartInfo.h"

@implementation WeeklyCompareTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _baseView.layer.cornerRadius = 6.0;
    _baseView.layer.masksToBounds = YES;
    _baseView.layer.borderColor = [UIColor colorWithHex:0xe5e5e5].CGColor;
    _baseView.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
    _graphBaseView.layer.cornerRadius = 6.0;
    _graphBaseView.layer.masksToBounds = YES;
    _graphBaseView.layer.borderColor = [UIColor colorWithHex:0xe5e5e5].CGColor;
    _graphBaseView.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
    
    for(NSInteger i=0; i < [_lastWeekViews count]; i++){
        
        NSLayoutConstraint *heightLayout = [_lastWeekHeightLayouts objectAtIndex:i];
        UIView *boxView = [_lastWeekViews objectAtIndex:i];
        UILabel *label = [_lastWeekScoreLabels objectAtIndex:i];
        
        boxView.backgroundColor = [UIColor clearColor];
        label.text = @"";
        heightLayout.constant = 0.0;
        boxView.hidden = YES;
    }
    
    for(NSInteger i=0; i < [_currentWeekViews count]; i++){
        
        NSLayoutConstraint *heightLayout = [_currentWeekHeightLayouts objectAtIndex:i];
        UIView *boxView = [_currentWeekViews objectAtIndex:i];
        UILabel *label = [_currentWeekScoreLabels objectAtIndex:i];
        
        boxView.backgroundColor = [UIColor clearColor];
        label.text = @"";
        heightLayout.constant = 0.0;
        boxView.hidden = YES;
    }
    [self layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLastWeekValues:(NSArray*)values
{
    for(NSInteger i=0; i < [_lastWeekViews count]; i++){
        
        NSLayoutConstraint *heightLayout = [_lastWeekHeightLayouts objectAtIndex:i];
        UIView *boxView = [_lastWeekViews objectAtIndex:i];
        UILabel *label = [_lastWeekScoreLabels objectAtIndex:i];
        
        if( i < [values count] ){
            StackBarChartInfo *info = [values objectAtIndex:i];
            boxView.backgroundColor = info.fillColor;
            label.text = [NSString stringWithFormat:@"%ld",info.score];
            heightLayout.constant = _lastWeekBaseView.frame.size.height * info.rate;
            boxView.hidden= NO;
        }
        else{
            boxView.hidden = YES;
        }
    }
    [UIView animateWithDuration:0.5 animations:^{
        [_lastWeekBaseView layoutIfNeeded];
    }];
}

- (void)setCurrentWeekValues:(NSArray*)values
{
    for(NSInteger i=0; i < [_currentWeekViews count]; i++){
        
        NSLayoutConstraint *heightLayout = [_currentWeekHeightLayouts objectAtIndex:i];
        UIView *boxView = [_currentWeekViews objectAtIndex:i];
        UILabel *label = [_currentWeekScoreLabels objectAtIndex:i];
        
        if( i < [values count] ){
            StackBarChartInfo *info = [values objectAtIndex:i];
            boxView.backgroundColor = info.fillColor;
            label.text = [NSString stringWithFormat:@"%ld",info.score];
            heightLayout.constant = _currentWeekBaseView.frame.size.height * info.rate;
            boxView.hidden= NO;
        }
        else{
            boxView.hidden = YES;
        }
    }
    [UIView animateWithDuration:0.5 animations:^{
        [_currentWeekBaseView layoutIfNeeded];
    }];
}

@end
