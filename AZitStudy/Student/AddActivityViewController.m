//
//  AddActivityViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "AddActivityViewController.h"
#import "IconCollectionViewCell.h"
#import "ActivityTypeCollectionViewCell.h"
#import "MenuInfo.h"

@interface AddActivityViewController ()
@property (strong, nonatomic) NSMutableArray *iconArray;
@end

@implementation AddActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.iconArray = [NSMutableArray arrayWithArray:@[
                                                      [[MenuInfo alloc] initWithTitle:nil type:1 imageName:@"icon_a" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:2 imageName:@"icon_b" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:3 imageName:@"icon_c" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:4 imageName:@"icon_d" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:5 imageName:@"icon_e" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:6 imageName:@"icon_f" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:7 imageName:@"icon_g" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:8 imageName:@"icon_h" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:9 imageName:@"icon_i" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:10 imageName:@"icon_j" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:11 imageName:@"icon_k" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:12 imageName:@"icon_l" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:13 imageName:@"icon_m" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:14 imageName:@"icon_n" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:15 imageName:@"icon_o" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:16 imageName:@"icon_p" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:17 imageName:@"icon_q" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:18 imageName:@"icon_r" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:19 imageName:@"icon_s" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:20 imageName:@"icon_t" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:21 imageName:@"icon_u" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:22 imageName:@"icon_v" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:23 imageName:@"icon_w" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:24 imageName:@"icon_x" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:25 imageName:@"icon_y" object:nil],
                                                      [[MenuInfo alloc] initWithTitle:nil type:26 imageName:@"icon_z" object:nil]
                                                      
                                                      ]];
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
    NSInteger count = 0;
    if( collectionView == _typeCollectionView )
        count = [_currentActArray count];
    else if( collectionView == _iconCollectionView )
        count = [_iconArray count];
    
    return count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView typeCollectionViewCellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    ActivityTypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath]
    ;
    MenuInfo *info = [_currentActArray objectAtIndex:indexPath.row];
    cell.itemInfo = info;
    
    return cell;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView iconCollectionViewCellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    IconCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    MenuInfo *info = [_iconArray objectAtIndex:indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:info.imageName];

    return cell;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    
    if( collectionView == _typeCollectionView )
        cell = [self collectionView:collectionView typeCollectionViewCellForRowAtIndexPath:indexPath];
    else if( collectionView == _iconCollectionView )
        cell = [self collectionView:collectionView iconCollectionViewCellForRowAtIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_inputTextField resignFirstResponder];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
//    CGPoint pos = [textField.superview convertPoint:textField.frame.origin toView:_contentsView];
    _contentsViewTopLayout.constant = -45.0;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _contentsViewTopLayout.constant = 0.0;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - action method
- (IBAction)doneAction:(id)sender {
    [_inputTextField resignFirstResponder];
    
    NSString *actStr = [_inputTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if( [actStr length] < 1){
        [self showToastMessage:@"활동을 입력해 주세요"];
        return;
    }
    NSArray *selectedIndexPaths = [_iconCollectionView indexPathsForSelectedItems];
    if( [selectedIndexPaths count] < 1 ){
        [self showToastMessage:@"아이콘을 선택해 주세요."];
        return;
    }
    
    NSIndexPath *iconIndexPath = [selectedIndexPaths firstObject];
    MenuInfo *iconInfo = [_iconArray objectAtIndex:iconIndexPath.row];
    MenuInfo *info = [[MenuInfo alloc] initWithTitle:actStr type:iconInfo.type imageName:iconInfo.imageName object:nil];
    self.actInfo = info;
    self.selectedButtonIndex = self.firstOtherButtonIndex;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
    else
        [self closeAction:nil];
}

@end
