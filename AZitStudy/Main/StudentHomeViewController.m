//
//  StudentHomeViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 10..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import "AddScheduleViewController.h"
#import "AnalyzeStudyViewController.h"
#import "StudentHomeViewController.h"
#import "QuestionViewController.h"
#import "StudentLeftMenuViewController.h"
#import "SettingsViewController.h"
#import "ReportViewController.h"
#import "DDayListViewController.h"
#import "ScheduleListTableViewCell.h"
#import "ActivityInfo.h"

#define POPUPTAG_LEFTMENU               100
#define POPUPTAG_ADDACTIVITY            101

@interface StudentHomeViewController ()<PopupViewControllerDelegate, SWTableViewCellDelegate>
@property (strong, nonatomic) NSMutableArray *itemArray;
@property (strong, nonatomic) NSDate *currentDate;
@end

@implementation StudentHomeViewController

- (void)updateCurrentDate:(NSDate*)date
{
    _dateLabel.text = [DateHelper dateStringFromDate:date withFormat:@"yyyy-MM-dd"];
}

- (void)setupView
{
    [super setupView];
    [self updateCurrentDate:self.currentDate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentDate = [NSDate date];
    self.itemArray = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    ScheduleListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    ActivityInfo *info = [_itemArray objectAtIndex:indexPath.row];
    cell.activityInfo = info;
    cell.delegate = self;
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - SWTableViewDelegate
- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index
{
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    if( indexPath ){
        if( index == 1 ){
            // delete
            [_itemArray removeObjectAtIndex:indexPath.row];
            [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}

#pragma mark - PopupViewControllerDelegate
- (void)popupViewController:(PopupBaseViewController *)controller didSelectButtonIndex:(NSInteger)buttonIndex
{
    if( [controller.objectTag integerValue] == POPUPTAG_LEFTMENU && buttonIndex >= controller.firstOtherButtonIndex ){
        NSInteger type = buttonIndex - controller.firstOtherButtonIndex;
        switch (type) {
            case LeftMenuType_Home:
                [self.navigationController popToRootViewControllerAnimated:YES];
                break;
            case LeftMenuType_AnalyzeStudy:
                [self analyzeStudyAction:nil];
                break;
            case LeftMenuType_AnalyzeScore:
                [self analyzeScoreAction:nil];
                break;
            case LeftMenuType_MeetMentor:
                [self meetMentorAction:nil];
                break;
            case LeftMenuType_Solve:
                [self solveQuestionAction:nil];
                break;
            case LeftMenuType_Report:
                [self reportAction:nil];
                break;
            case LeftMenuType_Question:
                [self questionAction:nil];
                break;
            case LeftMenuType_Invite:
                break;
            case LeftMenuType_Settings:
                [self settingAction:nil];
                break;
        }
        [controller hideAnimated:YES];
    }
    else if( [controller.objectTag integerValue] == POPUPTAG_ADDACTIVITY && buttonIndex >= controller.firstOtherButtonIndex ){
        AddScheduleViewController *addVC = (AddScheduleViewController*)controller;
        ActivityInfo *info = addVC.activityInfo;
        [_itemArray addObject:info];
        [_tableView reloadData];
        [controller closeAction:nil];
    }
}


#pragma mark - action method
- (void)settingAction:(id)sender
{
    SettingsViewController *nextVC = [AppDelegate viewControllerFromSettingsWithIdentifier:@"SettingsViewController"];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:nextVC];
    navCtrl.navigationBarHidden = YES;
    [self presentViewController:navCtrl animated:YES completion:nil];
}

- (void)questionAction:(id)sender
{
    QuestionViewController *nextVC = [AppDelegate viewControllerFromSettingsWithIdentifier:@"QuestionViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)menuAction:(id)sender {
    StudentLeftMenuViewController *menuVC = [AppDelegate viewControllerFromMainWithIdentifier:@"StudentLeftMenuViewController"];
    menuVC.delegate = self;
    menuVC.objectTag = @(POPUPTAG_LEFTMENU);
    [menuVC showFromViewController:self animated:YES];
}


- (IBAction)dateNextAction:(id)sender {
    self.currentDate = [DateHelper dateByAddingDays:1 fromDate:self.currentDate];
    [self updateCurrentDate:self.currentDate];
}

- (IBAction)datePrevAction:(id)sender {
    self.currentDate = [DateHelper dateByAddingDays:-1 fromDate:self.currentDate];
    [self updateCurrentDate:self.currentDate];
}

- (IBAction)messageBoxAction:(id)sender {
    BaseViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"MessageBoxViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)alarmAction:(id)sender {
    BaseViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"AlarmListViewController"];
    [self presentViewController:nextVC animated:YES completion:nil];
}

- (IBAction)analyzeStudyAction:(id)sender {
    AnalyzeStudyViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"AnalyzeStudyViewController"];
    nextVC.startIndex = @(0);
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)analyzeScoreAction:(id)sender {
    AnalyzeStudyViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"AnalyzeStudyViewController"];
    nextVC.startIndex = @(1);
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)meetMentorAction:(id)sender {
    BaseViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"MeetMentorViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)solveQuestionAction:(id)sender {
    BaseViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"SolveQuestionViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)reportAction:(id)sender {
    ReportViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"ReportViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (IBAction)addScheduleAction:(id)sender {
    AddScheduleViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"AddScheduleViewController"];
    nextVC.delegate = self;
    nextVC.targetDate = self.currentDate;
    nextVC.objectTag = @(POPUPTAG_ADDACTIVITY);
    [self presentViewController:nextVC animated:YES completion:nil];
}

- (IBAction)ddayAction:(id)sender {
    DDayListViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"DDayListViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}
@end
