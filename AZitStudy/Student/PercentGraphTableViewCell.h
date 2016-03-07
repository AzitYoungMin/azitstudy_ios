//
//  PercentGraphTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 29..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HACBarChart.h>

@class PercentChartInfo;
@interface PercentGraphTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet HACBarChart *chartView;

@property (strong, nonatomic) PercentChartInfo *chartInfo;

@end
