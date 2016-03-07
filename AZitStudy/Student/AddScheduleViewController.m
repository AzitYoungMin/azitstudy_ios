//
//  AddScheduleViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "AddScheduleViewController.h"
#import "AddActivityViewController.h"
#import "ActivityTypeCollectionViewCell.h"
#import "TitleCollectionViewCell.h"
#import "MenuInfo.h"
#import "ActivityInfo.h"

#define POPUPTAG_ADDACT                 100

@interface AddScheduleViewController ()<PopupViewControllerDelegate>
@property (strong, nonatomic) NSMutableArray *activityTypeArray;
@property (strong, nonatomic) NSMutableArray *subjectArray;
@property (strong, nonatomic) NSMutableArray *bookArray;

@end

@implementation AddScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.activityTypeArray = [NSMutableArray arrayWithArray:@[
                                                              [[MenuInfo alloc] initWithTitle:@"자습" type:1 imageName:@"icon_a" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"인강" type:2 imageName:@"icon_b" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"학교" type:3 imageName:@"icon_c" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"학원" type:5 imageName:@"icon_e" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"과외" type:6 imageName:@"icon_f" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"오답" type:7 imageName:@"icon_g" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"모의고사" type:8 imageName:@"icon_h" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"독서" type:12 imageName:@"icon_l" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"수면" type:9 imageName:@"icon_i" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"여가활동" type:10 imageName:@"icon_j" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"휴식" type:11 imageName:@"icon_k" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"식사" type:26 imageName:@"icon_z" object:nil],
                                                              [[MenuInfo alloc] initWithTitle:@"운동" type:4 imageName:@"icon_d" object:nil]
                                                              ]];
    self.subjectArray = [NSMutableArray arrayWithArray:@[
                                                         [[MenuInfo alloc] initWithTitle:@"국어" type:0 imageName:nil object:nil],
                                                         [[MenuInfo alloc] initWithTitle:@"수학" type:0 imageName:nil object:nil],
                                                         [[MenuInfo alloc] initWithTitle:@"영어" type:0 imageName:nil object:nil],
                                                         [[MenuInfo alloc] initWithTitle:@"과학" type:0 imageName:nil object:nil],
                                                         [[MenuInfo alloc] initWithTitle:@"사회" type:0 imageName:nil object:nil],
                                                         [[MenuInfo alloc] initWithTitle:@"제2외국어" type:0 imageName:nil object:nil],
                                                         [[MenuInfo alloc] initWithTitle:@"논술" type:0 imageName:nil object:nil],
                                                         [[MenuInfo alloc] initWithTitle:@"자소서" type:0 imageName:nil object:nil],
                                                         [[MenuInfo alloc] initWithTitle:@"비교과" type:0 imageName:nil object:nil],
                                                         [[MenuInfo alloc] initWithTitle:@"자격증" type:0 imageName:nil object:nil]
                                                         ]];
    self.bookArray = [NSMutableArray arrayWithArray:@[
                                                      [[MenuInfo alloc] initWithTitle:@"수능완성 수학1" type:0 imageName:nil object:nil],
                                                      [[MenuInfo alloc] initWithTitle:@"수능특강 수학1" type:0 imageName:nil object:nil],
                                                      [[MenuInfo alloc] initWithTitle:@"자이스토리 수학1" type:0 imageName:nil object:nil]
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
        count = [_activityTypeArray count]+1;
    else if( collectionView == _subjectCollectionView )
        count = [_subjectArray count];
    else if( collectionView == _bookCollectionView )
        count = [_bookArray count] + 1;
    
    return count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView typeCollectionViewCellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    ActivityTypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:( indexPath.row < [_activityTypeArray count] ? @"itemCell" : @"addCell") forIndexPath:indexPath]
    ;
    if( indexPath.row < [_activityTypeArray count] ){
        MenuInfo *info = [_activityTypeArray objectAtIndex:indexPath.row];
        cell.itemInfo = info;
    }
    
    return cell;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView subjectCollectionViewCellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    TitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    if( indexPath.row >= [_subjectArray count] ){
        cell.titleLabel.text = @"+";
    }
    else {
        MenuInfo *info = [_subjectArray objectAtIndex:indexPath.row];
        cell.titleLabel.text = info.title;
    }
    return cell;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView bookCollectionViewCellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    TitleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"itemCell" forIndexPath:indexPath];
    if( indexPath.row >= [_bookArray count] ){
        cell.titleLabel.text = @"+";
    }
    else {
        MenuInfo *info = [_bookArray objectAtIndex:indexPath.row];
        cell.titleLabel.text = info.title;
    }
    return cell;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = nil;
    
    if( collectionView == _typeCollectionView )
        cell = [self collectionView:collectionView typeCollectionViewCellForRowAtIndexPath:indexPath];
    else if( collectionView == _subjectCollectionView )
        cell = [self collectionView:collectionView subjectCollectionViewCellForRowAtIndexPath:indexPath];
    else if( collectionView == _bookCollectionView )
        cell = [self collectionView:collectionView bookCollectionViewCellForRowAtIndexPath:indexPath];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_goalTextField resignFirstResponder];
    if( collectionView == _typeCollectionView ){
        if( indexPath.row >= [_activityTypeArray count] ){
            // 추가버튼
            [collectionView deselectItemAtIndexPath:indexPath animated:NO];
            AddActivityViewController *addVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"AddActivityViewController"];
            addVC.delegate = self;
            addVC.objectTag = @(POPUPTAG_ADDACT);
            addVC.currentActArray = [NSArray arrayWithArray:_activityTypeArray];
            [self presentViewController:addVC animated:YES completion:nil];
        }
        else{
            
        }
    }
    else if( collectionView == _subjectCollectionView ){
        if( indexPath.row >= [_subjectArray count] ){
            // 추가버튼
            [collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
    }
    else if( collectionView == _bookCollectionView ){
        if( indexPath.row >= [_bookArray count] ){
            // 추가버튼
            [collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        else{
            
        }
    }
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
    CGPoint pos = [textField.superview convertPoint:textField.frame.origin toView:_contentsView];
    _contentsViewTopLayout.constant = -(_contentsView.frame.size.height - 300.0 );
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

#pragma mark - PopupViewControllerDelegate
- (void)popupViewController:(PopupBaseViewController *)controller didSelectButtonIndex:(NSInteger)buttonIndex
{
    if( [controller.objectTag integerValue] == POPUPTAG_ADDACT && buttonIndex >= controller.firstOtherButtonIndex ){
        AddActivityViewController *addVC = (AddActivityViewController*)controller;
        MenuInfo *info = addVC.actInfo;
        NSInteger insertIndex = [_activityTypeArray count];
        [_activityTypeArray addObject:info];
        [_typeCollectionView insertItemsAtIndexPaths:@[ [NSIndexPath indexPathForRow:insertIndex inSection:0]]];
        
        [controller closeAction:nil];
    }
}

#pragma mark - action method
- (IBAction)doneAction:(id)sender {
    [_goalTextField resignFirstResponder];
    
    NSArray *selectedIndexPaths = [_typeCollectionView indexPathsForSelectedItems];
    if( [selectedIndexPaths count] < 1 ){
        [self showToastMessage:@"활동을 선택해 주세요"];
        return;
    }
    
    NSArray *selectedBookIndexPaths = [_bookCollectionView indexPathsForSelectedItems];
    if( [selectedBookIndexPaths count] < 1 ){
        [self showToastMessage:@"교재를 선택해 주세요"];
        return;
    }
    
    NSString *goalText = [_goalTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if( [goalText length] < 1 ){
        [self showToastMessage:@"목표를 입력해 주세요."];
        return;
    }

    NSIndexPath *actIndexPath = [selectedIndexPaths firstObject];
    NSIndexPath *bookIndexPath = [selectedBookIndexPaths firstObject];
    MenuInfo *actInfo = [_activityTypeArray objectAtIndex:actIndexPath.row];
    MenuInfo *bookInfo = [_bookArray objectAtIndex:bookIndexPath.row];
    
    ActivityInfo *info = [[ActivityInfo alloc] init];
    info.type = @(actIndexPath.row+1);
    info.title = actInfo.title;
    info.subTitle = bookInfo.title;
    info.goal = goalText;
    info.typeId = @(actInfo.type);
    info.regDate = self.targetDate;
    self.activityInfo = info;
    
    self.selectedButtonIndex = self.firstOtherButtonIndex;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
    else
        [self closeAction:nil];
}


@end
