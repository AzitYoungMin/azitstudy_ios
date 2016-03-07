//
//  SubjectChartLegendCollectionViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SubjectChartLegendCollectionViewCell.h"
#import "SubjectPieCartInfo.h"
#import "Utility.h"

@implementation SubjectChartLegendCollectionViewCell

- (void)setChartInfo:(SubjectPieCartInfo *)chartInfo
{
    _chartInfo = chartInfo;
    _colorBoxView.backgroundColor = chartInfo.fillColor;
    _titleLabel.text = chartInfo.title;
    _timeLabel.text = ( chartInfo.time < 1.0 ? @"0분" : [Utility timeStringForTimeInterval:chartInfo.time] );
}

@end
