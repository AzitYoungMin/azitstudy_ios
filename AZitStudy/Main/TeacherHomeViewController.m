//
//  TeacherHomeViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 10..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "TeacherHomeViewController.h"
#import "StudentListTableViewCell.h"
#import "AddStudentViewController.h"
#import "SettingsViewController.h"
#import "StudentHistoryViewController.h"
#import "StudentInfo.h"
#import "ExamInfo.h"

@interface TeacherHomeViewController ()
@property (strong, nonatomic) NSMutableArray *itemArray;
@property (strong, nonatomic) NSMutableArray *examArray;

@end

@implementation TeacherHomeViewController
- (void)setupDataWithDummyInfo
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"studentlist" ofType:@"txt"]];
    NSDictionary *result = [Utility parseJsonObjectFromData:data];
    NSArray *jsonArray = [Utility parseJsonObjectFromData:[result safeObjectForKey:@"exam_list"]];
    ResultInfo *response = [[ResultInfo alloc] init];
    self.examArray = [response parseArrayResultForClass:[ExamInfo class] withArray:jsonArray];
    jsonArray = [Utility parseJsonObjectFromData:[result safeObjectForKey:@"student_list"]];
    self.itemArray = [response parseArrayResultForClass:[StudentInfo class] withArray:jsonArray];
}

- (void)updateCurrentExamInfo:(ExamInfo*)info
{
    [_examSelectButton setTitle:info.title forState:UIControlStateNormal];
}

- (void)requestStudentList
{
    [self setupDataWithDummyInfo];
    [_tableView reloadData];
    if( [self.examArray count] > 0 )
        [self updateCurrentExamInfo:[self.examArray firstObject]];
}

- (void)setupView
{
    [super setupView];
    if( [self.itemArray count] < 1 ){
        [self requestStudentList];
    }
    else
        [_tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if( [_tableView respondsToSelector:@selector(setLayoutMargins:)])
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
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
    StudentListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    StudentInfo *info = [_itemArray objectAtIndex:indexPath.row];
    cell.studentInfo = info;
    
    if( [[cell.checkButton allTargets] count] < 1 )
        [cell.checkButton addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( [cell respondsToSelector:@selector(setLayoutMargins:)])
        [cell setLayoutMargins:UIEdgeInsetsZero];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self resignAllAction];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    StudentHistoryViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"StudentHistoryViewController"];
    nextVC.studentInfo = [_itemArray objectAtIndex:indexPath.row];
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

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - action method
- (void)checkAction:(UIButton*)button
{
    NSIndexPath *indexPath = [_tableView indexPathForCell:[Utility findSuperViewIsUITableViewCell:button]];
    if( indexPath == nil )
        return;
    
    StudentInfo *info = [_itemArray objectAtIndex:indexPath.row];
    info.selected = !info.selected;
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (IBAction)checkAllAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    
    button.selected = !button.selected;
    for(StudentInfo *info in _itemArray)
        info.selected = button.selected;
    [_tableView reloadData];
}


- (IBAction)resignAllAction
{
    [_messageTextField resignFirstResponder];
}

- (IBAction)addAction:(id)sender {
    [self resignAllAction];
    AddStudentViewController *addVC = [AppDelegate viewControllerFromTeacherWithIdentifier:@"AddStudentViewController"];
    [self presentViewController:addVC animated:YES completion:nil];
}

- (IBAction)settingAction:(id)sender {
    [self resignAllAction];
    SettingsViewController *nextVC = [AppDelegate viewControllerFromSettingsWithIdentifier:@"SettingsViewController"];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:nextVC];
    navCtrl.navigationBarHidden = YES;
    [self presentViewController:navCtrl animated:YES completion:nil];
}

- (IBAction)sendAction:(id)sender {
    [self resignAllAction];
}
@end
