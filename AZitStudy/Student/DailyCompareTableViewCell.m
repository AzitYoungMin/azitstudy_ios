//
//  DailyCompareTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "DailyCompareTableViewCell.h"
#import "PieChartInfo.h"

@implementation DailyCompareTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _baseView.layer.cornerRadius = 6.0;
    _baseView.layer.masksToBounds = YES;
    _baseView.layer.borderColor = [UIColor colorWithHex:0xe5e5e5].CGColor;
    _baseView.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
    for(UIView *view in _graphBaseViews){
        view.layer.cornerRadius = 6.0;
        view.layer.masksToBounds = YES;
        view.layer.borderColor = [UIColor colorWithHex:0xe5e5e5].CGColor;
        view.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMyPieChartValues:(NSArray*)values
{
    [_myPieChartView reset];
    for(PieChartInfo *value in values){
        [_myPieChartView addAngleValue:value.rate andClolor:value.fillColor];
    }
}

- (void)setTopTenPieChartValues:(NSArray*)values
{
    [_topTenPieChartView reset];
    for(PieChartInfo *value in values){
        [_topTenPieChartView addAngleValue:value.rate andClolor:value.fillColor];
    }
}

@end
