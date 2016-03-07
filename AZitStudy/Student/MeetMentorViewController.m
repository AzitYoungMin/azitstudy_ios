//
//  MeetMentorViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "MeetMentorViewController.h"
#import "StudentQuestionDetailViewController.h"
#import "WriteQuestionViewController.h"
#import "MeetMentorListTableViewCell.h"
#import "SolveListInfo.h"

@interface MeetMentorViewController ()
@property (strong, nonatomic) NSMutableArray *itemArray;

@end

@implementation MeetMentorViewController

- (NSArray*)createDummyListArray
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mentorquestionlist" ofType:@"txt"]];
    ResultInfo *result = [[ResultInfo alloc] initWithData:data];
    NSData *arrayData = [[result.jsonData safeObjectForKey:@"posting_list"] dataUsingEncoding:NSUTF8StringEncoding];
    id jsonArray = [NSJSONSerialization JSONObjectWithData:arrayData options:0 error:nil];
    NSArray *array = [result parseArrayResultForClass:[SolveListInfo class] withArray:jsonArray];
    return array;
}

- (void)setupView
{
    [super setupView];
    if( [self.itemArray count] < 1 )
        self.itemArray = [NSMutableArray arrayWithArray:[self createDummyListArray]];
    [_tableView reloadData];
    _writeButton.hidden = [self.loginInfo isMentor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    MeetMentorListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    SolveListInfo *info = [_itemArray objectAtIndex:indexPath.row];
    cell.questionInfo = info;
    
    if( [[cell.replyButton allTargets] count] < 1 )
        [cell.replyButton addTarget:self action:@selector(replyAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self moveToQuestionDetailAtIndexPath:indexPath];
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
- (void)moveToQuestionDetailAtIndexPath:(NSIndexPath*)indexPath
{
    SolveListInfo *info = [_itemArray objectAtIndex:indexPath.row];
    StudentQuestionDetailViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"StudentQuestionDetailViewController"];
    nextVC.postId = info.postId;
    [self.navigationController pushViewController:nextVC animated:YES];
}


- (void)replyAction:(UIButton*)button
{
    NSIndexPath *indexPath = [_tableView indexPathForCell:[Utility findSuperViewIsUITableViewCell:button]];
    if( indexPath == nil )
        return;
    [self moveToQuestionDetailAtIndexPath:indexPath];
}

- (IBAction)writeAction:(id)sender {
    WriteQuestionViewController *writeVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"WriteQuestionViewController"];
    [self presentViewController:writeVC animated:YES completion:nil];
}
@end
