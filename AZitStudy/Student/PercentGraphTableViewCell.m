//
//  PercentGraphTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 29..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "PercentGraphTableViewCell.h"
#import "PercentChartInfo.h"

@implementation PercentGraphTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _chartView.showAxis = YES;
    _chartView.vertical = YES;
    _chartView.showDataValue = YES;
    _chartView.showCustomText = YES;
    _chartView.showProgressLabel = YES;
    _chartView.barsMargin = 23.0;
    _chartView.numberDividersAxisY = 3;
    _chartView.animationDuration = 0.5;
    _chartView.progressTextColor = [UIColor darkTextColor];
    _chartView.axisYTextColor = [UIColor darkTextColor];
    _chartView.progressTextFont = [UIFont systemFontOfSize:13.0];
    _chartView.typeBar = HACBarType2;
    _chartView.axisXColor = [UIColor colorWithHex:0xbbbbbb];
    _chartView.axisYColor = [UIColor colorWithHex:0xbbbbbb];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setChartInfo:(PercentChartInfo *)chartInfo
{
    _chartInfo = chartInfo;
    _titleLabel.text = chartInfo.title;
    
    [_chartView clearChart];
    NSMutableArray *dataArray = [NSMutableArray array];
    for(BarChartItemInfo *info in chartInfo.itemArray){
        [dataArray addObject:@{kHACPercentage:@(info.value), kHACColor:[UIColor colorWithHex:0x1fb4ff], kHACCustomText:[NSString stringWithFormat:@"%.0f",info.value] }];
    }
    _chartView.data = dataArray;
    [_chartView draw];
}

@end
