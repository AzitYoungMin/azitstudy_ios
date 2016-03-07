//
//  InputStudentInformationViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputStudentInformationViewController.h"
#import "InputStudentClassViewController.h"
#import "PopupSingleSelectViewController.h"
#import "RegisterMemberStudent.h"
#import "SelectItemInfo.h"

#define POPUPTAG_YEARSELECT             100

@interface InputStudentInformationViewController ()<PopupViewControllerDelegate>
@property (strong, nonatomic) NSMutableArray *selectYearArray;
@property (strong, nonatomic) SelectItemInfo *selectedInfo;

@end

@implementation InputStudentInformationViewController

- (void)updateSelectedYear:(SelectItemInfo *)info
{
    [_yearButton setTitle:info.title forState:UIControlStateNormal];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectYearArray = [NSMutableArray array];
    SelectItemInfo *info = [[SelectItemInfo alloc] initWithTitle:@"고1" selected:YES type:1];
    [_selectYearArray addObject:info];
    self.selectedInfo = info;
    info = [[SelectItemInfo alloc] initWithTitle:@"고2" selected:NO type:2];
    [_selectYearArray addObject:info];
    info = [[SelectItemInfo alloc] initWithTitle:@"고3" selected:NO type:3];
    [_selectYearArray addObject:info];
    info = [[SelectItemInfo alloc] initWithTitle:@"재도전" selected:NO type:4];
    [_selectYearArray addObject:info];
    [self updateSelectedYear:self.selectedInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - PopupViewControllerDelegate
- (void)popupViewController:(PopupBaseViewController *)controller didSelectButtonIndex:(NSInteger)buttonIndex
{
    if( [controller.objectTag integerValue] == POPUPTAG_YEARSELECT && buttonIndex >= controller.firstOtherButtonIndex ){
        SelectItemInfo *info = [_selectYearArray objectAtIndex:buttonIndex-controller.firstOtherButtonIndex];
        self.selectedInfo = info;
        [self updateSelectedYear:info];
    }
    [controller hideAnimated:YES];
}

#pragma mark - action method

- (IBAction)genderSelectAction:(id)sender {
    [self resignAllAction];
    
    UIButton *button = (UIButton*)sender;
    
    for(UIButton* btn in _genderButtons)
        btn.selected = NO;
    button.selected = YES;
}

- (IBAction)yearSelectAction:(id)sender {
    [self resignAllAction];
    PopupSingleSelectViewController *popupVC = [AppDelegate viewControllerFromPopupWithIdentifier:@"PopupSingleSelectViewController"];
    popupVC.delegate = self;
    popupVC.itemArray = [NSArray arrayWithArray:self.selectYearArray];
    popupVC.objectTag = @(POPUPTAG_YEARSELECT);
    [popupVC showFromViewController:self animated:YES];
}


- (IBAction)nextAction:(id)sender {
    [self resignAllAction];
    
    NSString *nameStr = [_nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *phoneNumStr = [_phoneNumberTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *nickname = [_nicknameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *schoolNameStr = [_schoolTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *parentNameStr = [_parentNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *parentPhoneStr = [_parentPhoneTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSInteger genderIndex = [_genderButtons indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = (UIButton*)obj;
        if( button.selected ){
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    
    if( [nameStr length] < 1 ){
        [self showToastMessage:@"이름을 입력해 주세요."];
        return;
    }
    else if( [nickname length] < 1 ){
        [self showToastMessage:@"닉네임을 입력해 주세요."];
        return;
    }
    else if( [phoneNumStr length] < 1 ){
        [self showToastMessage:@"핸드폰 번호를 입력해 주세요."];
        return;
    }
    else if( genderIndex == NSNotFound ){
        [self showToastMessage:@"성별을 선택해 주세요"];
        return;
    }
    else if( [parentNameStr length] < 1 ){
        [self showToastMessage:@"부모님 성명을 입력해 주세요."];
        return;
    }
    else if( [parentPhoneStr length] < 1 ){
        [self showToastMessage:@"부모님 핸드폰 번호를 입력해 주세요."];
        return;
    }
    
    _memberInfo.name = nameStr;
    _memberInfo.nickname = nickname;
    _memberInfo.phoneNumber = phoneNumStr;
    _memberInfo.educationPlaceId = @"1";
    _memberInfo.gender = ( genderIndex == 0 ? @"M" : @"F" );
    _memberInfo.classYear = @(_selectedInfo.type);
    _memberInfo.parentName = parentNameStr;
    _memberInfo.parentPhone = parentPhoneStr;
    
    InputStudentClassViewController *nextVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"InputStudentClassViewController"];
    nextVC.memberInfo = self.memberInfo;
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
