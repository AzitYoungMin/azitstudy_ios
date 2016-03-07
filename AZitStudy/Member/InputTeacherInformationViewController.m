//
//  InputTeacherInformationViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputTeacherInformationViewController.h"
#import "ProcessCertificationViewController.h"
#import "RegisterMemberTeacher.h"
#import "PopupDateTimeSelectViewController.h"

#define POPUPTAG_BIRTHDAY               100

@interface InputTeacherInformationViewController ()<PopupViewControllerDelegate>
@property (strong, nonatomic) NSDate *birthday;

@end

@implementation InputTeacherInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    if( [controller.objectTag integerValue] == POPUPTAG_BIRTHDAY && buttonIndex >= controller.firstOtherButtonIndex ){
        PopupDateTimeSelectViewController *dateVC = (PopupDateTimeSelectViewController*)controller;
        self.birthday = dateVC.selectedDate;
        [_birthdayButton setTitle:[DateHelper dateStringFromDate:self.birthday withFormat:@"yyyy년 MM월 dd일"] forState:UIControlStateNormal];
    }
    [controller hideAnimated:YES];
}

#pragma mark - actino method

- (IBAction)genderSelectAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    
    for(UIButton* btn in _genderButtons)
        btn.selected = NO;
    button.selected = YES;
}

- (IBAction)educationTypeSelectAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    
    for(UIButton* btn in _educationTypeButtons)
        btn.selected = NO;
    button.selected = YES;
}

- (IBAction)birthdaySelectAction:(id)sender {
    [self resignAllAction];
    PopupDateTimeSelectViewController *dateVC = [AppDelegate viewControllerFromPopupWithIdentifier:@"PopupDateTimeSelectViewController"];
    dateVC.delegate = self;
    dateVC.objectTag = @(POPUPTAG_BIRTHDAY);
    [dateVC showFromViewController:self animated:YES];
}

- (IBAction)doneAction:(id)sender {
    [self resignAllAction];
    NSString *nameStr = [_nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *phoneNumStr = [_phoneNumberTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *lastSchoolStr = [_lastSchoolTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *orgNameStr = [_orgNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSInteger graduateIndex = [_educationTypeButtons indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = (UIButton*)obj;
        if( button.selected ){
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    
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
    else if( self.birthday == nil ){
        [self showToastMessage:@"생일을 입력해 주세요."];
        return;
    }
    else if( [phoneNumStr length] < 1 ){
        [self showToastMessage:@"핸드폰 번호를 입력해 주세요."];
        return;
    }
    else if( [lastSchoolStr length] < 1 ){
        [self showToastMessage:@"최종학력을 입력해 주세요."];
        return;
    }
    else if( graduateIndex == NSNotFound ){
        [self showToastMessage:@"졸업여부를 선택해 주세요."];
        return;
    }
    else if( [orgNameStr length] < 1 ){
        [self showToastMessage:@"소속 학교/학원을 입력해 주세요."];
        return;
    }
    else if( genderIndex == NSNotFound ){
        [self showToastMessage:@"성별을 선택해 주세요"];
        return;
    }
    
    _memberInfo.name = nameStr;
    _memberInfo.birthday = [DateHelper dateStringFromDate:self.birthday withFormat:@"yyyy.Mm.dd"];
    _memberInfo.phoneNumber = phoneNumStr;
    _memberInfo.lastSchool = lastSchoolStr;
    _memberInfo.educationPlaceId = @"1";
    _memberInfo.isGraduated = BOOLToString((graduateIndex == 1));
    _memberInfo.gender = ( genderIndex == 0 ? @"M" : @"F" );
    
    [HTTPAPICommunicator sharedInstance].isShowProgress = YES;
    [HTTPAPICommunicator sharedInstance].progressMessage = @"처리중 입니다.";
    [[HTTPAPICommunicator sharedInstance] registerTeacher:self.memberInfo success:^(ResultInfo *response, id responseObject) {
        if( response.isSuccess ){
            [UIAlertView showWithTitle:nil message:@"가입되었습니다." cancelButtonTitle:@"확인" otherButtonTitles:nil tapBlock:^(UIAlertView * _Nonnull alertView, NSInteger buttonIndex) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }];
        }
        else{
            [self showToastMessage:@"회원가입에 실패했습니다."];
        }
    } failure:^(NSError *error, NSHTTPURLResponse *response) {

    }];
    
//    ProcessCertificationViewController *nextVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"ProcessCertificationViewController"];
//    [self.navigationController pushViewController:nextVC animated:YES];
    
}
@end
