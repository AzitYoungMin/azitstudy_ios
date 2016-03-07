//
//  StudyGraphSubjectViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "StudyGraphSubjectViewController.h"
#import "SubjectPieChartTableViewCell.h"
#import "SubjectGraphInfo.h"
#import "SubjectPieCartInfo.h"
#import "SubjectInfo.h"
#import "ScoreGraphSubjectCollectionViewCell.h"

@interface StudyGraphSubjectViewController ()
@property (strong, nonatomic) NSMutableArray *itemArray;
@property (strong, nonatomic) NSArray *menuArray;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@end

@implementation StudyGraphSubjectViewController

- (void)updateHeaderInfo:(SubjectInfo*)info
{
    _subjectLabel.text = [NSString stringWithFormat:@"이번 주 총 %@ 공부시간",info.subject];
    
    _studyTimeLabel.text = ( info.studyTime < 1.0 ? @"0시간 0분" : [Utility timeStringForTimeInterval:info.studyTime] );
    _topRankLabel.text = [NSString stringWithFormat:@"상위 %@등",[info.topRanking stringValue]];
}

- (void)setupView
{
    [super setupView];
    
    if( self.selectedIndexPath == nil ){
        self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [_collectionView selectItemAtIndexPath:self.selectedIndexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        SubjectInfo *info = [_menuArray firstObject];
        [self updateHeaderInfo:info];
        self.itemArray = [NSMutableArray arrayWithArray:info.graphInfoArray];
        [_tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SubjectInfo *lanInfo = [[SubjectInfo alloc] initWithSubject:@"국어" time:0 ranking:@(1)];
    SubjectInfo *mathInfo = [[SubjectInfo alloc] initWithSubject:@"수학" time:7200 ranking:@(1)];
    SubjectInfo *engInfo = [[SubjectInfo alloc] initWithSubject:@"영어" time:0 ranking:@(1)];
    SubjectInfo *sciInfo = [[SubjectInfo alloc] initWithSubject:@"탐구" time:0 ranking:@(1)];
    self.menuArray = @[ lanInfo, mathInfo, engInfo, sciInfo];
    
    lanInfo.graphInfoArray = [NSMutableArray array];
    SubjectGraphInfo *gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"내용별" items:@[
                                                                                     [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0xc2ecff] title:@"문학" time:0],
                                                                                     [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x88e0ff] title:@"비문학" time:0],
                                                                                     [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x56c7e2] title:@"화작문" time:0],
                                                                                     [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x1ca1b7] title:@"종합" time:0],
                                                                                     ]];
    [lanInfo.graphInfoArray addObject:gInfo];
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"방법별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0xc2ecff] title:@"기본서" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x88e0ff] title:@"문제풀이" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x56c7e2] title:@"EBS" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x1ca1b7] title:@"실전연습" time:0]
                                                                   ]];
    [lanInfo.graphInfoArray addObject:gInfo];
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"교재별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.15 color:[UIColor colorWithHex:0xc2ecff] title:@"자습" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x88e0ff] title:@"학원" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.15 color:[UIColor colorWithHex:0x56c7e2] title:@"학교" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x1ca1b7] title:@"과외" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x006289] title:@"인강" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x083c4c] title:@"오답" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x000000] title:@"모의고사" time:0]
                                                                   ]];
    [lanInfo.graphInfoArray addObject:gInfo];
    
    mathInfo.graphInfoArray = [NSMutableArray array];
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"내용별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:1.0 color:[UIColor colorWithHex:0xc2ecff] title:@"수학1" time:7200.0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x88e0ff] title:@"수학2" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x56c7e2] title:@"미통기" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x1ca1b7] title:@"기벡" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x006289] title:@"적통" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x083c4c] title:@"종합" time:0]
                                                                   ]];
    [mathInfo.graphInfoArray addObject:gInfo];
    
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"방법별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0xc2ecff] title:@"기본서" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x88e0ff] title:@"문제풀이" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:1 color:[UIColor colorWithHex:0x56c7e2] title:@"EBS" time:7200],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x1ca1b7] title:@"실전연습" time:0]
                                                                   ]];
    [mathInfo.graphInfoArray addObject:gInfo];
    
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"교재별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.0 color:[UIColor colorWithHex:0xc2ecff] title:@"자습" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x88e0ff] title:@"학원" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x56c7e2] title:@"학교" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x1ca1b7] title:@"과외" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:1.0 color:[UIColor colorWithHex:0x006289] title:@"인강" time:7200.0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x083c4c] title:@"오답" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0 color:[UIColor colorWithHex:0x000000] title:@"모의고사" time:0]
                                                                   ]];
    [mathInfo.graphInfoArray addObject:gInfo];
    
    engInfo.graphInfoArray = [NSMutableArray array];
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"내용별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.2 color:[UIColor colorWithHex:0xc2ecff] title:@"독해" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.2 color:[UIColor colorWithHex:0x88e0ff] title:@"청해" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.2 color:[UIColor colorWithHex:0x56c7e2] title:@"문법" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.2 color:[UIColor colorWithHex:0x1ca1b7] title:@"어휘" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.2 color:[UIColor colorWithHex:0x006289] title:@"종합" time:0]
                                                                   ]];
    [engInfo.graphInfoArray addObject:gInfo];
    
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"방법별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0xc2ecff] title:@"기본서" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x88e0ff] title:@"문제풀이" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x56c7e2] title:@"EBS" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x1ca1b7] title:@"실전연습" time:0]
                                                                   ]];
    [engInfo.graphInfoArray addObject:gInfo];
    
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"교재별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.15 color:[UIColor colorWithHex:0xc2ecff] title:@"자습" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x88e0ff] title:@"학원" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.15 color:[UIColor colorWithHex:0x56c7e2] title:@"학교" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x1ca1b7] title:@"과외" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x006289] title:@"인강" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x083c4c] title:@"오답" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x000000] title:@"모의고사" time:0]
                                                                   ]];
    [engInfo.graphInfoArray addObject:gInfo];
    
    sciInfo.graphInfoArray = [NSMutableArray array];
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"방법별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0xc2ecff] title:@"기본서" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x88e0ff] title:@"문제풀이" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x56c7e2] title:@"EBS" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.25 color:[UIColor colorWithHex:0x1ca1b7] title:@"실전연습" time:0]
                                                                   ]];
    [sciInfo.graphInfoArray addObject:gInfo];
    
    gInfo = [[SubjectGraphInfo alloc] initWithTitle:@"교재별" items:@[
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.15 color:[UIColor colorWithHex:0xc2ecff] title:@"자습" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x88e0ff] title:@"학원" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.15 color:[UIColor colorWithHex:0x56c7e2] title:@"학교" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x1ca1b7] title:@"과외" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x006289] title:@"인강" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x083c4c] title:@"오답" time:0],
                                                                   [[SubjectPieCartInfo alloc] initWithRate:0.14 color:[UIColor colorWithHex:0x000000] title:@"모의고사" time:0]
                                                                   ]];
    [sciInfo.graphInfoArray addObject:gInfo];
    
    _tableView.tableFooterView = ( self.isShowDetailButton ? _footerView : nil );
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
    return CGSizeMake( floorf( (_collectionView.frame.size.width - ([_menuArray count]-1)) / [_menuArray count]), _collectionView.frame.size.height);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SubjectInfo *info = [_menuArray objectAtIndex:indexPath.row];
    [self updateHeaderInfo:info];
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

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubjectPieChartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subjectChartCell"];
    SubjectGraphInfo *info = [_itemArray objectAtIndex:indexPath.row];
    cell.graphInfo = info;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 174.0;
}

#pragma mark = UITableViewDelegate
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubjectPieChartTableViewCell *chartCell = (SubjectPieChartTableViewCell*)cell;
    chartCell.collectionView.dataSource = nil;
    chartCell.collectionView.delegate = nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
