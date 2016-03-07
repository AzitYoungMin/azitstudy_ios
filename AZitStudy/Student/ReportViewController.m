//
//  ReportViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 3. 3..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ReportViewController.h"
#import "MenuInfo.h"

@interface ReportViewController ()
@property (strong, nonatomic) NSMutableArray *itemArray;
@end

@implementation ReportViewController

- (void)setupView
{
    [super setupView];
    [_collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.itemArray = [NSMutableArray array];
    
    MenuInfo *info = [[MenuInfo alloc] initWithTitle:@"학습 데이터 분석을 실행하여 자기 분석과 학습 가이드라인을 통해 내가 목표한 바를 이루기 위하여 실행해야 할 학습 전략을 제시합니다." type:0 imageName:@"icon_report1" object:nil];
    [_itemArray addObject:info];
    
    info = [[MenuInfo alloc] initWithTitle:@"학습 패턴을 분석해 드려요!" type:0 imageName:@"icon_report2" object:nil];
    [_itemArray addObject:info];
    
    info = [[MenuInfo alloc] initWithTitle:@"입시 정보를 알려드려요!" type:0 imageName:@"icon_report3" object:nil];
    [_itemArray addObject:info];
    
    info = [[MenuInfo alloc] initWithTitle:@"경쟁자와 학습비교 분석과\n나에게 맞는 교재, 강의를 추천해드려요!" type:0 imageName:@"icon_report4" object:nil];
    [_itemArray addObject:info];
    
    _pageControl.numberOfPages = [_itemArray count];
    [self updateCurrentPageInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectinoViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_itemArray count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    
    MenuInfo *info = [_itemArray objectAtIndex:indexPath.row];
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:10];
    imageView.image = [UIImage imageNamed:info.imageName];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return collectionView.frame.size;
}

#pragma mark - UICollectionViewDelegate

#pragma mark - UISCrollViewDelegate
- (void)updateCurrentPageInfo
{
    NSInteger index = _collectionView.contentOffset.x / _collectionView.frame.size.width;
    if( index >= 0 && index < [_itemArray count] ){
        MenuInfo *info = [_itemArray objectAtIndex:index];
        _titleLabel.text = info.title;
        _pageControl.currentPage = index;
        _nextButton.hidden = ( info == [_itemArray lastObject] );
        _prevButton.hidden = (index < 1 );
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self updateCurrentPageInfo];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if( !decelerate )
        [self updateCurrentPageInfo];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self updateCurrentPageInfo];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - action method
- (IBAction)nextAction:(id)sender {
    NSInteger index = _collectionView.contentOffset.x / _collectionView.frame.size.width;
    if( index >= 0 && (index+1) < [_itemArray count] ){
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index+1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}

- (IBAction)prevAction:(id)sender {
    NSInteger index = _collectionView.contentOffset.x / _collectionView.frame.size.width;
    if( index > 0 ){
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index-1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}

- (IBAction)applyAction:(id)sender {
}
@end
