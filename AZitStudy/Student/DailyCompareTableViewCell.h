//
//  DailyCompareTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SHPieChartView.h>

@interface DailyCompareTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *graphBaseViews;
@property (strong, nonatomic) IBOutlet SHPieChartView *myPieChartView;
@property (strong, nonatomic) IBOutlet SHPieChartView *topTenPieChartView;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIButton *prevButton;

- (void)setMyPieChartValues:(NSArray*)values;
- (void)setTopTenPieChartValues:(NSArray*)values;

@end
