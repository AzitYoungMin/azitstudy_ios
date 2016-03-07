//
//  SettingsViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SettingsViewController.h"
#import "ChangePasswordViewController.h"
#import "NoticeViewController.h"
#import "TermsViewController.h"
#import "QuestionViewController.h"
#import "ExitServiceViewController.h"
#import "MenuInfo.h"

@interface SettingsViewController ()
@property (strong, nonatomic) NSMutableArray *sectionArray;

@end

@implementation SettingsViewController

- (void)createMenus
{
    self.sectionArray = [NSMutableArray array];
    
    MenuInfo *sectionInfo = nil;
    NSMutableArray *itemArray = nil;
    
    if( [self.loginInfo isTeacher] ){
        sectionInfo = [[MenuInfo alloc] initWithTitle:@"초대하기" type:0 imageName:nil object:nil];
        [_sectionArray addObject:sectionInfo];
        
        itemArray = [NSMutableArray arrayWithArray:@[
                                                     [[MenuInfo alloc] initWithTitle:@"학생 초대하기" type:SettingMenuType_StudentInvite imageName:nil object:@"defaultCell"],
                                                     [[MenuInfo alloc] initWithTitle:@"멘토 초대하기" type:SettingMenuType_MentorInvite imageName:nil object:@"defaultCell"],
                                                     [[MenuInfo alloc] initWithTitle:@"선생님 초대하기" type:SettingMenuType_TeacherInvite imageName:nil object:@"defaultCell"]
                                                     ]];
        sectionInfo.object = itemArray;
    }
    
    sectionInfo = [[MenuInfo alloc] initWithTitle:@"알림" type:0 imageName:nil object:nil];
    [_sectionArray addObject:sectionInfo];
    
    itemArray = [NSMutableArray arrayWithArray:@[
                                                 [[MenuInfo alloc] initWithTitle:@"푸쉬알림" type:SettingMenuType_PushAlarm imageName:nil object:@"pushCell"]
                                                 ]];
    sectionInfo.object = itemArray;
    
    
    sectionInfo = [[MenuInfo alloc] initWithTitle:@"계정관리" type:0 imageName:nil object:nil];
    [_sectionArray addObject:sectionInfo];
    
    itemArray = [NSMutableArray array ];
    [itemArray addObject:[[MenuInfo alloc] initWithTitle:nil type:SettingMenuType_UserId imageName:nil object:@"defaultCell"]];
    [itemArray addObject:[[MenuInfo alloc] initWithTitle:nil type:SettingMenuType_UserName imageName:nil object:@"defaultCell"]];
    if( [self.loginInfo isMentor] )
        [itemArray addObject:[[MenuInfo alloc] initWithTitle:nil type:SettingMenuType_ClassYear imageName:nil object:@"classYearCell"]];
    else if( [self.loginInfo isTeacher] ){
        [itemArray addObject:[[MenuInfo alloc] initWithTitle:nil type:SettingMenuType_LastSchool imageName:nil object:@"rightDetailCell"]];
        [itemArray addObject:[[MenuInfo alloc] initWithTitle:nil type:SettingMenuType_CurrentSchool imageName:nil object:@"defaultCell"]];
    }
    else if( [self.loginInfo isStudent] ){
        [itemArray addObject:[[MenuInfo alloc] initWithTitle:nil type:SettingMenuType_StudentGrade imageName:nil object:@"classYearCell"]];
    }

    [itemArray addObject:[[MenuInfo alloc] initWithTitle:@"비밀번호 변경" type:SettingMenuType_ChangePassword imageName:nil object:@"defaultCell"]];
    [itemArray addObject:[[MenuInfo alloc] initWithTitle:nil type:SettingMenuType_EditPhoneNumber imageName:nil object:@"phoneNumberCell"]];
    sectionInfo.object = itemArray;
    
    
    if( [self.loginInfo isStudent] ){
        sectionInfo = [[MenuInfo alloc] initWithTitle:@"결제내역" type:0 imageName:nil object:nil];
        [_sectionArray addObject:sectionInfo];
        
        itemArray = [NSMutableArray arrayWithArray:@[
                                                     [[MenuInfo alloc] initWithTitle:@"결제일" type:SettingMenuType_PurchaseDate imageName:nil object:@"rightDetailCell"],
                                                     [[MenuInfo alloc] initWithTitle:@"보유금액" type:SettingMenuType_Money imageName:nil object:@"rightDetailCell"],
                                                     [[MenuInfo alloc] initWithTitle:@"리포트 전송횟수" type:SettingMenuType_ReportCount imageName:nil object:@"rightDetailCell"],
                                                     [[MenuInfo alloc] initWithTitle:@"환불" type:SettingMenuType_Refund imageName:nil object:@"refundCell"]
                                                     ]];
        sectionInfo.object = itemArray;
    }
    
    sectionInfo = [[MenuInfo alloc] initWithTitle:@"서비스 및 문의" type:0 imageName:nil object:nil];
    [_sectionArray addObject:sectionInfo];
    
    itemArray = [NSMutableArray arrayWithArray:@[
                                                 [[MenuInfo alloc] initWithTitle:@"공지사항" type:SettingMenuType_Notice imageName:nil object:@"defaultCell"],
                                                 [[MenuInfo alloc] initWithTitle:@"버전정보" type:SettingMenuType_Version imageName:nil object:@"rightDetailCell"],
                                                 [[MenuInfo alloc] initWithTitle:@"이용약관 및 개인정보 취급방침" type:SettingMenuType_Terms imageName:nil object:@"defaultCell"],
                                                 [[MenuInfo alloc] initWithTitle:@"컨텐츠 제보" type:SettingMenuType_ContentsTip imageName:nil object:@"defaultCell"],
                                                 [[MenuInfo alloc] initWithTitle:@"문의하기" type:SettingMenuType_Question imageName:nil object:@"defaultCell"]
                                                 
                                                 ]];
    sectionInfo.object = itemArray;
    
    sectionInfo = [[MenuInfo alloc] initWithTitle:@"" type:0 imageName:nil object:nil];
    [_sectionArray addObject:sectionInfo];
    
    itemArray = [NSMutableArray arrayWithArray:@[
                                                 [[MenuInfo alloc] initWithTitle:@"로그아웃" type:SettingMenuType_Logout imageName:nil object:@"defaultCell"],
                                                 [[MenuInfo alloc] initWithTitle:@"회원탈퇴" type:SettingMenuType_ExitService imageName:nil object:@"defaultCell"]
                                                 ]];
    sectionInfo.object = itemArray;
}

- (void)setupView
{
    [super setupView];
    [_tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if( [_tableView respondsToSelector:@selector(setLayoutMargins:)])
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    
    [self createMenus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MenuInfo *info = [_sectionArray objectAtIndex:section];
    NSArray *array = (NSArray*)info.object;
    return [array count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuInfo *sectionInfo = [_sectionArray objectAtIndex:indexPath.section];
    NSArray *subArray = (NSArray*)sectionInfo.object;
    MenuInfo *itemInfo = [subArray objectAtIndex:indexPath.row];
    NSString *cellId = (NSString*)itemInfo.object;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    switch (itemInfo.type) {
        case SettingMenuType_PushAlarm:{
            UILabel *titleLabel = (UILabel*)[cell viewWithTag:10];
            UISwitch *swButton = (UISwitch*)[cell viewWithTag:11];
            titleLabel.text = itemInfo.title;
            if( [[swButton allTargets] count] < 1 )
                [swButton addTarget:self action:@selector(togglePushSettingAction:) forControlEvents:UIControlEventValueChanged];
        }
            break;
        case SettingMenuType_UserId:{
            ProfileInfo *profile = (ProfileInfo*)self.profileInfo;
            cell.textLabel.text = ( profile ? profile.email : nil );
        }
            break;
        case SettingMenuType_UserName:{
            ProfileInfo *profile = (ProfileInfo*)self.profileInfo;
            cell.textLabel.text = ( profile ? profile.name : nil );
        }
            break;
        case SettingMenuType_ClassYear:{
            UILabel *titleLabel = (UILabel*)[cell viewWithTag:10];
            MentorProfilInfo *profile = (MentorProfilInfo*)self.profileInfo;
            titleLabel.text = ( profile ? profile.classYear : nil );
        }
            break;
        case SettingMenuType_EditPhoneNumber:{
            UITextField *textField = (UITextField*)[cell viewWithTag:10];
            UIButton *button = (UIButton*)[cell viewWithTag:11];
            
            ProfileInfo *profile = (ProfileInfo*)self.profileInfo;
            textField.text = ( profile ? profile.phoneNumber : nil );
            if( [[button allTargets] count] < 1 )
                [button addTarget:self action:@selector(changePhoneNumberAction:) forControlEvents:UIControlEventTouchUpInside];
        }
            break;
        case SettingMenuType_Version:
            cell.textLabel.text = itemInfo.title;
            cell.detailTextLabel.text = [Utility bundleShortVersion];
            break;
        case SettingMenuType_ChangePassword:
        case SettingMenuType_Notice:
        case SettingMenuType_Terms:
        case SettingMenuType_ContentsTip:
        case SettingMenuType_Question:
        case SettingMenuType_Logout:
        case SettingMenuType_ExitService:
        case SettingMenuType_StudentInvite:
        case SettingMenuType_MentorInvite:
        case SettingMenuType_TeacherInvite:
            cell.textLabel.text = itemInfo.title;
            break;
        case SettingMenuType_LastSchool:{
            TeacherProfileInfo *profile = (TeacherProfileInfo*)self.profileInfo;
            cell.textLabel.text = ( profile ? profile.lastSchool : nil );
            cell.detailTextLabel.text = ( profile ? ( profile.isGraduated ? @"졸업" : @"재학") : nil );
        }
            break;
        case SettingMenuType_CurrentSchool:{
            TeacherProfileInfo *profile = (TeacherProfileInfo*)self.profileInfo;
            cell.textLabel.text = ( profile ? profile.instituteName : nil );
        }
            break;
        case SettingMenuType_StudentGrade:{
            UILabel *titleLabel = (UILabel*)[cell viewWithTag:10];
            ProfileInfo *profile = (ProfileInfo*)self.profileInfo;
            titleLabel.text = ( profile ? profile.classYear : nil );
        }
            break;
        case SettingMenuType_PurchaseDate:
            cell.textLabel.text = itemInfo.title;
            cell.detailTextLabel.text = @"2015/12/11";
            break;
        case SettingMenuType_Money:
            cell.textLabel.text = itemInfo.title;
            cell.detailTextLabel.text = [@(20000) decimalStyleFormatString];
            break;
        case SettingMenuType_ReportCount:
            cell.textLabel.text = itemInfo.title;
            cell.detailTextLabel.text = @"1";
            break;
        case SettingMenuType_Refund:{
            UILabel *titleLabel = (UILabel*)[cell viewWithTag:10];
            UIButton *changeButton = (UIButton*)[cell viewWithTag:11];
            
            titleLabel.text = itemInfo.title;
            if( [[changeButton allTargets] count] < 1 )
                [changeButton addTarget:self action:@selector(changeRefundAction:) forControlEvents:UIControlEventTouchUpInside]  ;
        }
            break;
    }
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MenuInfo *sectionInfo = [_sectionArray objectAtIndex:section];
    return sectionInfo.title;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return ( section + 1 >= [_sectionArray count] ? 22.0 : 0.01 );
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MenuInfo *sectionInfo = [_sectionArray objectAtIndex:indexPath.section];
    NSArray *subArray = (NSArray*)sectionInfo.object;
    MenuInfo *itemInfo = [subArray objectAtIndex:indexPath.row];
    
    UIViewController *nextVC = nil;
    switch (itemInfo.type) {
        case SettingMenuType_PushAlarm:
            break;
        case SettingMenuType_UserId:
            break;
        case SettingMenuType_UserName:
            break;
        case SettingMenuType_ClassYear:
            break;
        case SettingMenuType_ChangePassword:{
            ChangePasswordViewController *passwordVC = [AppDelegate viewControllerFromSettingsWithIdentifier:@"ChangePasswordViewController"];
            nextVC = passwordVC;
        }
            break;
        case SettingMenuType_EditPhoneNumber:
            break;
        case SettingMenuType_Notice:{
            NoticeViewController *noticeVC = [AppDelegate viewControllerFromSettingsWithIdentifier:@"NoticeViewController"];
            nextVC = noticeVC;
        }
            break;
        case SettingMenuType_Version:
            break;
        case SettingMenuType_Terms:{
            TermsViewController *termsVC = [AppDelegate viewControllerFromSettingsWithIdentifier:@"TermsViewController"];
            nextVC = termsVC;
        }
            break;
        case SettingMenuType_ContentsTip:
            break;
        case SettingMenuType_Question:{
            QuestionViewController *questionVC = [AppDelegate viewControllerFromSettingsWithIdentifier:@"QuestionViewController"];
            nextVC = questionVC;
        }
            break;
        case SettingMenuType_Logout:{
            [self dismissViewControllerAnimated:YES completion:nil];
            [[AppDelegate appDelegate] logout];
            [[AppDelegate appDelegate] moveToLogin];
        }
            break;
        case SettingMenuType_ExitService:{
            ExitServiceViewController *exitVC = [AppDelegate viewControllerFromSettingsWithIdentifier:@"ExitServiceViewController"];
            [self presentViewController:exitVC animated:YES completion:nil];
        }
            break;
        case SettingMenuType_StudentInvite:
            break;
        case SettingMenuType_MentorInvite:
            break;
        case SettingMenuType_TeacherInvite:
            break;
        case SettingMenuType_LastSchool:
            break;
        case SettingMenuType_CurrentSchool:
            break;
        case SettingMenuType_StudentGrade:
            break;
        case SettingMenuType_PurchaseDate:
            break;
        case SettingMenuType_Money:
            break;
        case SettingMenuType_ReportCount:
            break;
        case SettingMenuType_Refund:
            break;
    }
    
    if( nextVC )
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
#pragma mark - action method
- (void)changePhoneNumberAction:(UIButton*)button
{
    
}

- (void)changeRefundAction:(UIButton*)button
{
    
}

- (void)togglePushSettingAction:(UISwitch*)swButton
{
    
}

@end
