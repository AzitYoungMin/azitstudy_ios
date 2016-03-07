//
//  TotalAnalyzeTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "TotalAnalyzeTableViewCell.h"
#import "PieChartInfo.h"

@implementation TotalAnalyzeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _baseView.layer.cornerRadius = 6.0;
    _baseView.layer.masksToBounds = YES;
    _baseView.layer.borderColor = [UIColor colorWithHex:0xe5e5e5].CGColor;
    _baseView.layer.borderWidth = 1.0 / [UIScreen mainScreen].scale;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPieChartValues:(NSArray*)values
{
    [_pieChartView reset];
    for(PieChartInfo *value in values){
        [_pieChartView addAngleValue:value.rate andClolor:value.fillColor];
    }
}

@end
