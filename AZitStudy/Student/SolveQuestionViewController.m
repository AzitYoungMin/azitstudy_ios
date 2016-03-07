//
//  SolveQuestionViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SolveQuestionViewController.h"
#import "StudentQuestionDetailViewController.h"
#import "SolveListTableViewCell.h"
#import "SubjectCollectionViewCell.h"
#import "MenuInfo.h"
#import "ListResultInfo.h"
#import "SolveListInfo.h"
#import "ImageInfo.h"

@interface SolveQuestionViewController ()
@property (strong, nonatomic) NSMutableArray *menuArray;
@property (strong, nonatomic) NSMutableArray *itemArray;

@end

@implementation SolveQuestionViewController

- (NSArray*)createDummyListArray
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"solvelist" ofType:@"txt"]];
    ResultInfo *result = [[ResultInfo alloc] initWithData:data];
    NSData *arrayData = [[result.jsonData safeObjectForKey:@"posting_list"] dataUsingEncoding:NSUTF8StringEncoding];
    id jsonArray = [NSJSONSerialization JSONObjectWithData:arrayData options:0 error:nil];
    NSArray *array = [result parseArrayResultForClass:[SolveListInfo class] withArray:jsonArray];
    return array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 199.0;
    
    self.menuArray = [NSMutableArray arrayWithArray:@[
                                                      [[MenuInfo alloc] initWithTitle:@"국어" type:0 imageName:nil object:nil],
                                                      [[MenuInfo alloc] initWithTitle:@"수학" type:0 imageName:nil object:nil],
                                                      [[MenuInfo alloc] initWithTitle:@"영어" type:0 imageName:nil object:nil],
                                                      [[MenuInfo alloc] initWithTitle:@"탐구" type:0 imageName:nil object:nil],
                                                      [[MenuInfo alloc] initWithTitle:@"예체능" type:0 imageName:nil object:nil]
                                                      ]];
    self.itemArray = [NSMutableArray arrayWithArray:[self createDummyListArray]];
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
    SubjectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    MenuInfo *info = [_menuArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = info.title;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    _underbarViewLeadingLayout.constant = indexPath.row * 64.0;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
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
    SolveListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    SolveListInfo *info = [_itemArray objectAtIndex:indexPath.row];
    cell.solveInfo = info;
    
    if( [info.imageArray count] > 0 ){
        ImageInfo *imgInfo = [info.imageArray firstObject];
        NSURL *imageUrl = [[HTTPAPICommunicator sharedInstance] remoteImageURLWithPath:imgInfo.imageUrl];
        UIImage *image = [self cachedImageFromURL:imageUrl];
        if( image ){
            CGFloat rate = ( tableView.frame.size.width - 87.0) / image.size.width;
            cell.imageHeightLayout.constant = image.size.height * rate;
        }
        else{
            [cell.attachImageView setCachedImageFromURL:imageUrl placeholderImage:nil placeHolderContentMode:UIViewContentModeScaleToFill completeContentMode:UIViewContentModeScaleToFill success:^(UIImage *image) {
                [_tableView reloadData];
            } failure:^(NSError *error) {

            }];
        }
    }
    else{
        cell.imageHeightLayout.constant = 0.0;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SolveListInfo *info = [_itemArray objectAtIndex:indexPath.row];
    StudentQuestionDetailViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"StudentQuestionDetailViewController"];
    nextVC.postId = info.postId;
    [self.navigationController pushViewController:nextVC animated:YES];
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
