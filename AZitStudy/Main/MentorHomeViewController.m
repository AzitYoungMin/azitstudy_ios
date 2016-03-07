//
//  MentorHomeViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 10..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <MessageUI/MessageUI.h>
#import "MentorHomeViewController.h"
#import "StudentLeftMenuViewController.h"
#import "SettingsViewController.h"
#import "MeetMentorViewController.h"
#import "SolveQuestionViewController.h"

@interface MentorHomeViewController ()<PopupViewControllerDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation MentorHomeViewController

- (void)updateProfileInfo
{
    if( self.profileInfo ){
        MentorProfilInfo *info = (MentorProfilInfo*)self.profileInfo;
        _nameLabel.text = info.name;
        _commentLabel.text = info.introduce;
        if( [info.profileImage length] > 0 ){
            [_profileImageView setCachedImageFromURL:[[HTTPAPICommunicator sharedInstance] remoteImageURLWithPath:info.profileImage] placeholderImage:[UIImage imageNamed:@"icon_join_mentor"]];
        }
    }
}

- (void)setupView
{
    [super setupView];
    [self updateProfileInfo];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _profileImageView.layer.cornerRadius = _profileImageView.frame.size.height * 0.5;
    _profileImageView.layer.masksToBounds = YES;
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
    NSInteger type = buttonIndex - controller.firstOtherButtonIndex;
    switch (type) {
        case LeftMenuType_Home:
            break;
        case LeftMenuType_MentoringReply:
            [self meetMenteeAction:nil];
            break;
        case LeftMenuType_Solve:
            [self solveAction:nil];
            break;
        case LeftMenuType_Question:
            [self emailAction:nil];
            break;
        case LeftMenuType_Settings:
            [self settingAction:nil];
            break;
        case LeftMenuType_EditProfile:
            break;
        case LeftMenuType_Point:
            [self managePointAction:nil];
            break;
    }
    [controller hideAnimated:YES];
}

#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - action method
- (IBAction)menuAction:(id)sender {
    StudentLeftMenuViewController *menuVC = [AppDelegate viewControllerFromMainWithIdentifier:@"StudentLeftMenuViewController"];
    menuVC.delegate = self;
    [menuVC showFromViewController:self animated:YES];
}

- (void)settingAction:(id)sender
{
    SettingsViewController *nextVC = [AppDelegate viewControllerFromSettingsWithIdentifier:@"SettingsViewController"];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:nextVC];
    navCtrl.navigationBarHidden = YES;
    [self presentViewController:navCtrl animated:YES completion:nil];
}

- (void)emailAction:(id)sender
{
    if( ![MFMailComposeViewController canSendMail] )
        return;
    
    MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
    mailVC.mailComposeDelegate = self;
    [mailVC setToRecipients:@[@"help@azitstudy.com"]];
    [self presentViewController:mailVC animated:YES completion:nil];
}

- (IBAction)editProfileAction:(id)sender {
}

- (IBAction)alarmAction:(id)sender {
    BaseViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"AlarmListViewController"];
    [self presentViewController:nextVC animated:YES completion:nil];
}

- (IBAction)answerListAction:(id)sender {
    
    BaseViewController *nextVC = [AppDelegate viewControllerFromMentoWithIdentifier:@"AnswerListViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)managePointAction:(id)sender {
    BaseViewController *nextVC = [AppDelegate viewControllerFromMentoWithIdentifier:@"PointListViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)meetMenteeAction:(id)sender {
    MeetMentorViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"MeetMentorViewController"];
    nextVC.title = @"멘토링 답변";
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)solveAction:(id)sender {
    SolveQuestionViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"SolveQuestionViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
