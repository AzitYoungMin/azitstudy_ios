//
//  TotalAnalyzeTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SHPieChartView.h>

@interface TotalAnalyzeTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet SHPieChartView *pieChartView;
@property (strong, nonatomic) IBOutlet UILabel *classRateLabel;
@property (strong, nonatomic) IBOutlet UILabel *soloStudyRateLabel;

- (void)setPieChartValues:(NSArray*)values;

@end
