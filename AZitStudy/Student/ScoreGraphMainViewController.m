//
//  ScoreGraphMainViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ScoreGraphMainViewController.h"
#import "ScoreGraphSubjectCollectionViewCell.h"
#import "MenuInfo.h"
#import "ScoreBoardInfo.h"
#import "PercentChartInfo.h"
#import "SubjectInfo.h"
#import "ScoreBoardTableViewCell.h"
#import "PercentGraphTableViewCell.h"

typedef NS_ENUM(NSInteger,SubjectType){
    SubjectType_Language,
    SubjectType_Math,
    SubjectType_English,
    SubjectType_Science,
};

@interface ScoreGraphMainViewController ()
@property (strong, nonatomic) NSArray *menuArray;
@property (strong, nonatomic) NSMutableArray *itemArray;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation ScoreGraphMainViewController

- (void)setupView
{
    [super setupView];
    if( self.selectedIndexPath == nil ){
        self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [_collectionView selectItemAtIndexPath:_selectedIndexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        SubjectInfo *info = [_menuArray firstObject];
        self.itemArray = [NSMutableArray arrayWithArray:info.graphInfoArray];
        [_tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView.tableFooterView = ( self.isShowDetailButton ? _footerView : nil );
    
    SubjectInfo *lanInfo = [[SubjectInfo alloc] initWithSubject:@"국어" time:0 ranking:nil];
    SubjectInfo *mathInfo = [[SubjectInfo alloc] initWithSubject:@"수학" time:7200 ranking:nil];
    SubjectInfo *engInfo = [[SubjectInfo alloc] initWithSubject:@"영어" time:0 ranking:nil];
    SubjectInfo *sciInfo = [[SubjectInfo alloc] initWithSubject:@"탐구" time:0 ranking:nil];
    self.menuArray = @[ lanInfo, mathInfo, engInfo, sciInfo];
    
    lanInfo.graphInfoArray = [NSMutableArray array];
    mathInfo.graphInfoArray = [NSMutableArray array];
    engInfo.graphInfoArray = [NSMutableArray array];
    sciInfo.graphInfoArray = [NSMutableArray array];
    
    ScoreBoardInfo *scoreInfo = nil;
    PercentChartInfo *chartInfo = nil;
    
    scoreInfo = [[ScoreBoardInfo alloc] initWithTitle:@"등급"];
    scoreInfo.monthArray = [NSMutableArray arrayWithArray:@[@"6월", @"3월", @"1월"]];
    scoreInfo.averageScoreArray = [NSMutableArray arrayWithArray:@[@(90),@(35),@(22)]];
    scoreInfo.originalScoreArray = [NSMutableArray arrayWithArray:@[@(90),@(35),@(12)]];
    scoreInfo.gradeArray = [NSMutableArray arrayWithArray:@[@(2),@(7),@(9)]];
    [lanInfo.graphInfoArray addObject:scoreInfo];
    
    chartInfo = [[PercentChartInfo alloc] initWithTitle:@"전국 백분위" items:@[
                                                                          [[BarChartItemInfo alloc] initWithValue:90 title:@"6월"],
                                                                          [[BarChartItemInfo alloc] initWithValue:35 title:@"3월"],
                                                                          [[BarChartItemInfo alloc] initWithValue:22 title:@"1월"]
                                                                          ]];
    [lanInfo.graphInfoArray addObject:chartInfo];
    
    scoreInfo = [[ScoreBoardInfo alloc] initWithTitle:@"등급"];
    scoreInfo.monthArray = [NSMutableArray arrayWithArray:@[@"6월", @"3월", @"1월"]];
    scoreInfo.averageScoreArray = [NSMutableArray arrayWithArray:@[@(80),@(35),@(22)]];
    scoreInfo.originalScoreArray = [NSMutableArray arrayWithArray:@[@(80),@(35),@(12)]];
    scoreInfo.gradeArray = [NSMutableArray arrayWithArray:@[@(3),@(7),@(9)]];
    [mathInfo.graphInfoArray addObject:scoreInfo];
    
    chartInfo = [[PercentChartInfo alloc] initWithTitle:@"전국 백분위" items:@[
                                                                          [[BarChartItemInfo alloc] initWithValue:80 title:@"6월"],
                                                                          [[BarChartItemInfo alloc] initWithValue:35 title:@"3월"],
                                                                          [[BarChartItemInfo alloc] initWithValue:22 title:@"1월"]
                                                                          ]];
    [mathInfo.graphInfoArray addObject:chartInfo];
    
    scoreInfo = [[ScoreBoardInfo alloc] initWithTitle:@"등급"];
    scoreInfo.monthArray = [NSMutableArray arrayWithArray:@[@"6월", @"3월", @"1월"]];
    scoreInfo.averageScoreArray = [NSMutableArray arrayWithArray:@[@(70),@(35),@(22)]];
    scoreInfo.originalScoreArray = [NSMutableArray arrayWithArray:@[@(70),@(35),@(21)]];
    scoreInfo.gradeArray = [NSMutableArray arrayWithArray:@[@(4),@(7),@(8)]];
    [engInfo.graphInfoArray addObject:scoreInfo];
    
    chartInfo = [[PercentChartInfo alloc] initWithTitle:@"전국 백분위" items:@[
                                                                          [[BarChartItemInfo alloc] initWithValue:70 title:@"6월"],
                                                                          [[BarChartItemInfo alloc] initWithValue:35 title:@"3월"],
                                                                          [[BarChartItemInfo alloc] initWithValue:22 title:@"1월"]
                                                                          ]];
    [engInfo.graphInfoArray addObject:chartInfo];
 
    scoreInfo = [[ScoreBoardInfo alloc] initWithTitle:@"사회문화 등급"];
    scoreInfo.monthArray = [NSMutableArray arrayWithArray:@[@"6월", @"3월", @"1월"]];
    scoreInfo.averageScoreArray = [NSMutableArray arrayWithArray:@[@(50),@(35),@(22)]];
    scoreInfo.originalScoreArray = [NSMutableArray arrayWithArray:@[@(50),@(35),@(22)]];
    scoreInfo.gradeArray = [NSMutableArray arrayWithArray:@[@(6),@(7),@(8)]];
    [sciInfo.graphInfoArray addObject:scoreInfo];
    
    chartInfo = [[PercentChartInfo alloc] initWithTitle:@"사회문화 전국 백분위" items:@[
                                                                          [[BarChartItemInfo alloc] initWithValue:60 title:@"6월"],
                                                                          [[BarChartItemInfo alloc] initWithValue:35 title:@"3월"],
                                                                          [[BarChartItemInfo alloc] initWithValue:22 title:@"1월"]
                                                                          ]];
    [sciInfo.graphInfoArray addObject:chartInfo];
    
    scoreInfo = [[ScoreBoardInfo alloc] initWithTitle:@"한국사 등급"];
    scoreInfo.monthArray = [NSMutableArray arrayWithArray:@[@"6월", @"3월", @"1월"]];
    scoreInfo.averageScoreArray = [NSMutableArray arrayWithArray:@[@(50),@(35),@(22)]];
    scoreInfo.originalScoreArray = [NSMutableArray arrayWithArray:@[@(50),@(35),@(22)]];
    scoreInfo.gradeArray = [NSMutableArray arrayWithArray:@[@(6),@(7),@(8)]];
    [sciInfo.graphInfoArray addObject:scoreInfo];
    
    chartInfo = [[PercentChartInfo alloc] initWithTitle:@"한국사 전국 백분위" items:@[
                                                                               [[BarChartItemInfo alloc] initWithValue:5 title:@"6월"],
                                                                               [[BarChartItemInfo alloc] initWithValue:35 title:@"3월"],
                                                                               [[BarChartItemInfo alloc] initWithValue:22 title:@"1월"]
                                                                               ]];
    [sciInfo.graphInfoArray addObject:chartInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_menuArray count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ScoreGraphSubjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    SubjectInfo *info = [_menuArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = info.subject;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake( floorf((collectionView.frame.size.width-([_menuArray count]-1)) / [_menuArray count]), collectionView.frame.size.height);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SubjectInfo *info = [_menuArray objectAtIndex:indexPath.row];
    self.itemArray = [NSMutableArray arrayWithArray:info.graphInfoArray];
    [_tableView reloadData];
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

- (UITableViewCell*)tableView:(UITableView *)tableView scoreBoardCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ScoreBoardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scoreBoardCell"];
    ScoreBoardInfo *info = [_itemArray objectAtIndex:indexPath.row];
    cell.scoreInfo = info;
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView percentGraphCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PercentGraphTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"percentGraphCell"];
    PercentChartInfo *info = [_itemArray objectAtIndex:indexPath.row];
    cell.chartInfo = info;
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    id info = [_itemArray objectAtIndex:indexPath.row];
    if( [info isKindOfClass:[ScoreBoardInfo class]] )
        cell = [self tableView:tableView scoreBoardCellForRowAtIndexPath:indexPath];
    else if( [info isKindOfClass:[PercentChartInfo class]] )
        cell = [self tableView:tableView percentGraphCellForRowAtIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat retHeight = 0.0;
    
    id info = [_itemArray objectAtIndex:indexPath.row];
    if( [info isKindOfClass:[ScoreBoardInfo class]] )
        retHeight = 200.0;
    else if( [info isKindOfClass:[PercentChartInfo class]] )
        retHeight = 191.0;
    
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

@end
