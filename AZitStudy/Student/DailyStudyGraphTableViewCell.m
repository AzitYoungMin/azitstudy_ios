//
//  DailyStudyGraphTableViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import <SHPlot.h>
#import "DailyStudyGraphTableViewCell.h"

@implementation DailyStudyGraphTableViewCell

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
    
    for(UIView *colorView in _legendColorViews){
        colorView.layer.cornerRadius = colorView.frame.size.height * 0.5;
        colorView.layer.masksToBounds = YES;
    }
    _graphView.themeAttributes = @{ kXAxisLabelColorKey:[UIColor darkGrayColor], kYAxisLabelColorKey:[UIColor clearColor],kXAxisLabelFontKey:[UIFont systemFontOfSize:11.0], kYAxisLabelFontKey:[UIFont systemFontOfSize:11.0]};
    _graphView.yAxisSuffix = @"";
    
    _graphView.yAxisRange = @(100);
    _graphView.xAxisValues = @[
                               @{@(0) : @"일"},
                               @{@(1) : @"월"},
                               @{@(2) : @"화"},
                               @{@(3) : @"수"},
                               @{@(4) : @"목"},
                               @{@(5) : @"금"},
                               @{@(6) : @"토"}
                               ];
    SHPlot *topPlot = [[SHPlot alloc] init];
    topPlot.plottingValues = @[
                               @{@(0) : @(0)},
                               @{@(1) : @(100)},
                               @{@(2) : @(0)},
                               @{@(3) : @(20)},
                               @{@(4) : @(0)},
                               @{@(5) : @(0)},
                               @{@(6) : @(0)}
                               ];
    topPlot.plotThemeAttributes = @{kPlotFillColorKey:[UIColor colorWithHex:0xE0Edfa alpha:0.8], kPlotStrokeWidthKey:@(1), kPlotPointFillColorKey : [UIColor blueColor] };
    
    SHPlot *myPlot = [[SHPlot alloc] init];
    myPlot.plottingValues = @[
                              @{@(0) : @(0)},
                              @{@(1) : @(0)},
                              @{@(2) : @(0)},
                              @{@(3) : @(0)},
                              @{@(4) : @(0)},
                              @{@(5) : @(0)},
                              @{@(6) : @(0)}
                              ];
    myPlot.plotThemeAttributes = @{kPlotFillColorKey:[UIColor colorWithHex:0xFF0000 alpha:0.8], kPlotStrokeWidthKey:@(1), kPlotPointFillColorKey : [UIColor redColor] };
    
    [_graphView addPlot:topPlot];
    [_graphView addPlot:myPlot];
    [_graphView setupTheView];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
