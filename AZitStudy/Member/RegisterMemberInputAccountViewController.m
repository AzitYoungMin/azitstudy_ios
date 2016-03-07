//
//  RegisterMemberInputAccountViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "RegisterMemberInputAccountViewController.h"
#import "InputMentorInformationViewController.h"
#import "InputStudentInformationViewController.h"
#import "InputTeacherInformationViewController.h"
#import "RegisterMemberBaseInfo.h"
#import "EmailCheckResult.h"
#import "RegisterMemberMentor.h"
#import "RegisterMemberStudent.h"
#import "RegisterMemberTeacher.h"

@interface RegisterMemberInputAccountViewController ()

@end

@implementation RegisterMemberInputAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if( self.memberType != MemberType_Teacher ){
        _teacherTypeViewHeightLayout.constant = 0.0;
        _teacherTypeView.hidden = YES;
    }
    [self hideErrorMessageAnimated:NO];
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
#pragma mark - action method
- (void)showErrorMessageAnimated:(BOOL)animated
{
    _errorMessageHeightLayout.constant = 25.0;
    _errorMessageView.hidden = NO;
    [UIView animateWithDuration:(animated ? 0.25 : 0.0) animations:^{
        [self.tableView.tableHeaderView layoutIfNeeded];
    }];
}

- (void)hideErrorMessageAnimated:(BOOL)animated
{
    _errorMessageHeightLayout.constant = 0.0;
    _errorMessageView.hidden = YES;
    [UIView animateWithDuration:(animated ? 0.25 : 0.0) animations:^{
        [self.tableView.tableHeaderView layoutIfNeeded];
    }];
}

- (IBAction)selectTeacherTypeAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    for(UIButton *btn in _teacherTypeButtons)
        btn.selected = NO;
    button.selected = YES;
}

- (IBAction)nextAction:(id)sender {
    [self resignAllAction];
    
    NSString *emailStr = [_emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *passwordStr = [_passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *confirmPwdStr = [_confirmPasswordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if( [emailStr length] < 1 ){
        [self showToastMessage:@"이메일 주소를 입력해 주세요."];
        return;
    }
    else if( [passwordStr length] < 1 ){
        [self showToastMessage:@"비밀번호를 입력해 주세요."];
        return;
    }
    else if( [passwordStr length] < 8 ){
        [self showToastMessage:@"비밀번호는 8자리 이상이어야 합니다."];
        return;
    }
    else if( [confirmPwdStr length] < 1 ){
        [self showToastMessage:@"비밀번호를 한번 더 입력해 주세요."];
        return;
    }
    else if( ![confirmPwdStr isEqualToString:passwordStr] ){
        [self showToastMessage:@"입력한 비밀번호가 다릅니다."];
        return;
    }
    
    NSInteger typeIndex = NSNotFound;
    if( self.memberType == MemberType_Teacher ){
        typeIndex = [_teacherTypeButtons indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *button = (UIButton*)obj;
            if( button.selected ){
                *stop = YES;
                return YES;
            }
            
            return NO;
        }];
        if( typeIndex == NSNotFound ){
            [self showToastMessage:@"소속을 선택해 주세요."];
            return;
        }
    }
    
    _memberInfo.email = emailStr;
    _memberInfo.password = passwordStr;
    
    [HTTPAPICommunicator sharedInstance].isShowProgress = NO;
    [[HTTPAPICommunicator sharedInstance] checkEmail:emailStr success:^(ResultInfo *response, id responseObject) {
        if( response.isSuccess ){
            EmailCheckResult *result = [[EmailCheckResult alloc] initWithData:response.jsonData];
            
            if( result.isDuplicated ){
                [self showErrorMessageAnimated:YES];
            }
            else{
                [self hideErrorMessageAnimated:YES];
                UIViewController *nextVC = nil;
                
                if( self.memberType == MemberType_Mentor ){
                    InputMentorInformationViewController *mentorVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"InputMentorInformationViewController"];
                    mentorVC.memberInfo = (RegisterMemberMentor*)self.memberInfo;
                    nextVC = mentorVC;
                }
                else if( self.memberType == MemberType_Student ){
                    InputStudentInformationViewController *studentVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"InputStudentInformationViewController"];
                    studentVC.memberInfo = (RegisterMemberStudent*)self.memberInfo;
                    nextVC = studentVC;
                }
                else if( self.memberType == MemberType_Teacher ){
                    InputTeacherInformationViewController *teacherVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"InputTeacherInformationViewController"];
                    teacherVC.memberInfo = (RegisterMemberTeacher*)self.memberInfo;
                    teacherVC.memberInfo.classification = ( typeIndex == 0 ? @"A" : @"B" );
                    nextVC = teacherVC;
                }
                if( nextVC ){
                    [self.navigationController pushViewController:nextVC animated:YES];
                }
            }
        }
    } failure:^(NSError *error, NSHTTPURLResponse *response) {
        
    }];
    
    
}

@end
