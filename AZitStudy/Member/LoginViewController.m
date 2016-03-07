//
//  LoginViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterSelectTypeViewController.h"
#import "FindPasswordViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
- (void)requestProfileInfoWithUser:(LoginInfo*)info
{
    [HTTPAPICommunicator sharedInstance].isShowProgress = YES;
    [[HTTPAPICommunicator sharedInstance] profileInfoWithUserId:info.userId memberType:info.memberType success:^(ResultInfo *response, id responseObject) {
        if( response.isSuccess ){
            id profileInfo = nil;
            if( [info isMentor] )
                profileInfo = [[MentorProfilInfo alloc] initWithData:response.jsonData];
            else if( [info isStudent] )
                profileInfo = [[ProfileInfo alloc] initWithData:response.jsonData];
            else if( [info isTeacher] )
                profileInfo = [[TeacherProfileInfo alloc] initWithData:response.jsonData];

            [[AppDelegate appDelegate] setProfileInfo:profileInfo];
        }

        if( [info isMentor] )
            [[AppDelegate appDelegate] moveToMentor];
        else if( [info isStudent] )
            [[AppDelegate appDelegate] moveToStudent];
        else if( [info isTeacher] )
            [[AppDelegate appDelegate] moveToTeacher];
    } failure:^(NSError *error, NSHTTPURLResponse *response) {
        if( [info isMentor] )
            [[AppDelegate appDelegate] moveToMentor];
        else if( [info isStudent] )
            [[AppDelegate appDelegate] moveToStudent];
        else if( [info isTeacher] )
            [[AppDelegate appDelegate] moveToTeacher];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _emailBaseView.layer.cornerRadius = _emailBaseView.frame.size.height*0.5;
    _emailBaseView.layer.borderWidth = 1.0;
    _emailBaseView.layer.borderColor = [[UIColor colorWithHex:0xA1BED9] CGColor];
    _emailBaseView.layer.masksToBounds = YES;
    
    _passwordBaseView.layer.cornerRadius = _passwordBaseView.frame.size.height*0.5;
    _passwordBaseView.layer.borderWidth = 1.0;
    _passwordBaseView.layer.borderColor = [[UIColor colorWithHex:0xA1BED9] CGColor];
    _passwordBaseView.layer.masksToBounds = YES;
    
    _findPasswordButton.titleLabel.attributedText = [[NSAttributedString alloc] initWithString:@"비밀번호 찾기" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithHex:0xA1BED9], NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle), NSUnderlineColorAttributeName:[UIColor colorWithHex:0xA1BED9]}];
    _registerButton.titleLabel.attributedText = [[NSAttributedString alloc] initWithString:@"가입하기" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle), NSUnderlineColorAttributeName:[UIColor whiteColor]}];
    
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
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if( textField == _emailTextField )
        [_passwordTextField becomeFirstResponder];
    else if( textField == _passwordTextField )
        [self loginAction:nil];
    
    return YES;
}

#pragma mark - action method
- (IBAction)autoLoginCheckAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    button.selected = !button.selected;
}

- (IBAction)loginAction:(id)sender {
    [self resignAllAction];
    NSString *emailStr = [_emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *passwordStr = [_passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if( [emailStr length] < 1 ){
        [self showToastMessage:@"이메일을 입력해 주세요."];
        return;
    }
    else if( [passwordStr length] < 1 ){
        [self showToastMessage:@"비밀번호를 입력해 주세요."];
        return;
    }
    
    [HTTPAPICommunicator sharedInstance].isShowProgress = YES;
    [HTTPAPICommunicator sharedInstance].progressMessage = @"로그인 중입니다.";
    [[HTTPAPICommunicator sharedInstance] loginUserWithEmail:emailStr password:passwordStr pushToken:nil success:^(ResultInfo *response, id responseObject) {
        if( response.isSuccess ){
            LoginInfo *result = [[LoginInfo alloc] initWithData:response.jsonData];
            [[AppDelegate appDelegate] loginWithInfo:result];
            [self requestProfileInfoWithUser:result];
        }
        else{
            [self showToastMessage:@"로그인 실패하였습니다."];
        }
    } failure:^(NSError *error, NSHTTPURLResponse *response) {

    }];
}

- (IBAction)findPasswordAction:(id)sender {
    FindPasswordViewController *nextVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"FindPasswordViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)registerAction:(id)sender {
    RegisterSelectTypeViewController *nextVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"RegisterSelectTypeViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
