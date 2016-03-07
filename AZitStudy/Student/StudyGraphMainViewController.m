//
//  StudyGraphMainViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "StudyGraphMainViewController.h"
#import "Utility.h"
#import "CircleProgressView.h"
#import "TotalAnalyzeTableViewCell.h"
#import "DailyCompareTableViewCell.h"
#import "DailyStudyGraphTableViewCell.h"
#import "WeeklyCompareTableViewCell.h"
#import "PieChartInfo.h"
#import "StackBarChartInfo.h"

typedef NS_ENUM(NSInteger,GraphType){
    GraphType_Total,
    GraphType_DailyCompare,
    GraphType_DailyLineGraph,
    GraphType_WeeklyCompare,
    
};

@interface StudyGraphMainViewController ()
@property (strong, nonatomic) NSMutableArray *itemArray;

@end

@implementation StudyGraphMainViewController
- (void)updateCircleGraphInfoWithMyTime:(NSTimeInterval)myTime goalTime:(NSTimeInterval)goalTime
{

    _elapsedTimeLabel.text = [Utility timeStringWithTimeInterval:myTime];
    _goalTimeLabel.text = [Utility timeStringWithTimeInterval:goalTime];
    _circleGraphView.timeLimit = goalTime;
    _circleGraphView.elapsedTime = myTime;
    _circleGraphView.tintColor = [UIColor colorWithHex:0x1FB4FF];
    _circleGraphView.statusTextHidden = YES;
    
}

- (void)updateTimeGraphWithMyTime:(NSTimeInterval)myTime topTenTime:(NSTimeInterval)topTenTime goalTime:(NSTimeInterval)goalTime
{
    CGFloat myRate = myTime / goalTime;
    CGFloat topTenRate = topTenTime / goalTime;
    NSTimeInterval difTime = topTenTime - myTime;
    CGFloat difRate = myTime / topTenTime;
    
    if( myRate > 1.0 )
        myRate = 1.0;
    if( topTenRate > 1.0 )
        topTenRate = 1.0;
    if( difRate > 1.0 )
        difRate = 1.0;
    
    _myStudyTimeLabel.text = [Utility timeStringWithTimeInterval:myTime];
    _topTenStudyTimeLabel.text = [Utility timeStringWithTimeInterval:topTenTime];
    _difTimeLabel.text = [Utility timeStringWithTimeInterval:ABS(difTime)];
    
    _myTimeGraphTrailingLayout.constant = _myTimeGraphBaseView.frame.size.width - _myTimeGraphBaseView.frame.size.width * myRate;
    _topTenGraphTrailingLayout.constant = _topTenGraphBaseView.frame.size.width - _topTenGraphBaseView.frame.size.width * topTenRate;
    _difGraphTrailingLayout.constant = _difTimeGraphBaseView.frame.size.width - _difTimeGraphBaseView.frame.size.width * difRate;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)setupView
{
    [super setupView];
    
    if( [self.itemArray count] < 1 )
        self.itemArray = [NSMutableArray arrayWithArray:@[@(GraphType_Total),@(GraphType_DailyCompare),@(GraphType_DailyLineGraph),@(GraphType_WeeklyCompare)]];
    [_tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView.tableFooterView = ( self.isShowDetailButton ? _footerView : nil );
    _goalSettingButton.layer.cornerRadius = 4.0;
    _goalSettingButton.layer.masksToBounds = YES;
    _goalSettingButton.hidden = !self.isShowDetailButton;
    
    myStudyTime = 7200.0;
    dailyGoalTime = 43200.0;
    topTenStudyTime = 25200.0;
    
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 188.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateCircleGraphInfoWithMyTime:myStudyTime goalTime:dailyGoalTime*7];
    [self updateTimeGraphWithMyTime:myStudyTime topTenTime:topTenStudyTime goalTime:dailyGoalTime];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_itemArray count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView totalGraphCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TotalAnalyzeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"totalAnalyzeCell"];
    NSArray *values = @[
                        [[PieChartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0xC5E5F6]],
                        [[PieChartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x92D4F7]],
                        [[PieChartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x76CBEF]],
                        [[PieChartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x299CCE]]
                        ];
    [cell setPieChartValues:values];
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView dailyCompareCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DailyCompareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dailyCompareCell"];
    NSArray *myValues = @[
                        [[PieChartInfo alloc] initWithRate:0.1 color:[UIColor colorWithHex:0xC5E5F6]],
                        [[PieChartInfo alloc] initWithRate:0.2 color:[UIColor colorWithHex:0x92D4F7]],
                        [[PieChartInfo alloc] initWithRate:0.2 color:[UIColor colorWithHex:0x76CBEF]],
                        [[PieChartInfo alloc] initWithRate:0.2 color:[UIColor colorWithHex:0x299CCE]],
                        [[PieChartInfo alloc] initWithRate:0.1 color:[UIColor colorWithHex:0x006289]],
                        [[PieChartInfo alloc] initWithRate:0.1 color:[UIColor colorWithHex:0x33393d]],
                        [[PieChartInfo alloc] initWithRate:0.1 color:[UIColor colorWithHex:0xdbdbdb]]
                        ];
    NSArray *topTenValues = @[
                          [[PieChartInfo alloc] initWithRate:0.3 color:[UIColor colorWithHex:0xC5E5F6]],
                          [[PieChartInfo alloc] initWithRate:0.3 color:[UIColor colorWithHex:0x92D4F7]],
                          [[PieChartInfo alloc] initWithRate:0.1 color:[UIColor colorWithHex:0x76CBEF]],
                          [[PieChartInfo alloc] initWithRate:0.1 color:[UIColor colorWithHex:0x299CCE]],
                          [[PieChartInfo alloc] initWithRate:0.1 color:[UIColor colorWithHex:0x006289]],
                          [[PieChartInfo alloc] initWithRate:0.05 color:[UIColor colorWithHex:0x33393d]],
                          [[PieChartInfo alloc] initWithRate:0.05 color:[UIColor colorWithHex:0xdbdbdb]]
                          ];
    [cell setMyPieChartValues:myValues];
    [cell setTopTenPieChartValues:topTenValues];
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView dailyStudyGraphCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DailyStudyGraphTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dailyStudyGraphCell"];
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView weeklyCompareCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeeklyCompareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weeklyCompareCell"];
    NSArray *lastValues = @[
                            [[StackBarChartInfo alloc] initWithRate:0.526 score:2633 color:[UIColor colorWithHex:0x80ACCA]],
                            [[StackBarChartInfo alloc] initWithRate:0.214 score:1073 color:[UIColor colorWithHex:0x092337]],
                            [[StackBarChartInfo alloc] initWithRate:0.168 score:840 color:[UIColor colorWithHex:0x53777a]],
                          ];
    NSArray *currentValues = @[];
    [cell setLastWeekValues:lastValues];
    [cell setCurrentWeekValues:currentValues];
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    NSInteger graphType = [[_itemArray objectAtIndex:indexPath.row] integerValue];
    
    switch (graphType) {
        case GraphType_Total:
            cell = [self tableView:tableView totalGraphCellForRowAtIndexPath:indexPath];
            break;
        case GraphType_DailyCompare:
            cell = [self tableView:tableView dailyCompareCellForRowAtIndexPath:indexPath];
            break;
        case GraphType_DailyLineGraph:
            cell = [self tableView:tableView dailyStudyGraphCellForRowAtIndexPath:indexPath];
            break;
        case GraphType_WeeklyCompare:
            cell = [self tableView:tableView weeklyCompareCellForRowAtIndexPath:indexPath];
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat retHeight = 0.0;
    
    NSInteger graphType = [[_itemArray objectAtIndex:indexPath.row] integerValue];
    
    switch (graphType) {
        case GraphType_Total:
            retHeight = 188.0;
            break;
        case GraphType_DailyCompare:
            retHeight = 218.0;
            break;
        case GraphType_DailyLineGraph:
            retHeight = 217.0;
            break;
        case GraphType_WeeklyCompare:
            retHeight = 214.0;
            break;
    }
    
    return retHeight;
}

#pragma mark - UITableViewDelegate

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - action method

@end
