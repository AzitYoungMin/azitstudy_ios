//
//  StudentQuestionDetailViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "StudentQuestionDetailViewController.h"
#import "QuestionTextTableViewCell.h"
#import "QuestionReplyCommentTableViewCell.h"
#import "QuestionMentorReplyScoreTableViewCell.h"
#import "QuestionMentorReplyTableViewCell.h"
#import "SolveListInfo.h"
#import "ReplyCommentInfo.h"
#import "ImageInfo.h"
#import "SolveAnswerInfo.h"
#import "SolveDetailInfo.h"

@interface StudentQuestionDetailViewController ()
@property (strong, nonatomic) NSMutableArray *commentArray;
@property (strong, nonatomic) SolveDetailInfo   *detailInfo;
@end

@implementation StudentQuestionDetailViewController

- (SolveDetailInfo*)dummyDataWithPosId:(NSNumber*)postId
{
    NSString *fileName = [NSString stringWithFormat:@"solve_%@.txt",[postId stringValue]];
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension] ofType:[fileName pathExtension]]];
    SolveDetailInfo *info = nil;
    if( data ){
        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        info = [[SolveDetailInfo alloc] initWithData:jsonData];
    }
    
    return info;
}

- (void)scrollToLast:(NSIndexPath*)indexPath
{
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

- (void)requestAddReplyCommentWithText:(NSString*)text
{
    ProfileInfo *profile = (ProfileInfo*)self.loginInfo.profileInfo;
    
    
    if( [self.loginInfo isMentor] ){
        SolveAnswerInfo *info = [[SolveAnswerInfo alloc] init];
        info.answerId = @(rand());
        info.article = text;
        info.writerId = @([self.loginInfo.userId integerValue]);
        info.writerName = profile.name;
        info.profileImage = profile.profileImage;
        info.createDate = [NSDate date];
        info.isChoosen = NO;
        info.score = nil;
        info.replyCount = @(0);
        
        NSInteger insertIndex = [_detailInfo.answerArray count]*2;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:insertIndex inSection:1];
        NSIndexPath *scoreIndexPath = [NSIndexPath indexPathForRow:insertIndex+1 inSection:1];
        [_detailInfo.answerArray addObject:info];
        [_tableView insertRowsAtIndexPaths:@[indexPath,scoreIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self performSelector:@selector(scrollToLast:) withObject:indexPath afterDelay:0.3];
    }
    else if( [self.loginInfo isStudent] ){
        ReplyCommentInfo *info = [[ReplyCommentInfo alloc] init];
        info.replyId = @(rand());
        info.article = text;
        info.replyImage = nil;
        info.writerName = profile.name;
        info.profileImage = profile.profileImage;
        info.writerId = @([self.loginInfo.userId integerValue]);
        info.writerRole = [self.loginInfo userTypeString];
        info.createDate = [NSDate date];
        info.likeCount = @(0);
        info.replyCount = @(0);
        info.isSelectLike = NO;
        
        NSInteger insertIndex = [_detailInfo.replyArray count];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:insertIndex inSection:2];
        [_detailInfo.replyArray addObject:info];
        [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self performSelector:@selector(scrollToLast:) withObject:indexPath afterDelay:0.3];
    }
}

- (void)requestDetailInFoWithPostId:(NSNumber*)postId
{
    self.detailInfo = [self dummyDataWithPosId:postId];
    [self updateBasicInfo:_detailInfo];
    [_tableView reloadData];
}

- (void)updateBasicInfo:(SolveDetailInfo*)info
{
    _titleLabel.text = info.title;
    _writerNameLabel.text = info.writerName;
    _createDateLabel.text = [DateHelper dateStringFromDate:info.createDate withFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (void)setupView
{
    [super setupView];
    if( self.detailInfo == nil )
        [self requestDetailInFoWithPostId:self.postId];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 50.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    if( section == 0 )
        count = 1;
    else if( section == 1 )
        count = [_detailInfo.answerArray count] * 2;
    else if( section == 2 )
        count = [_detailInfo.replyArray count];
    
    return count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView questionTextCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"questionCell"];
    cell.articleLabel.text = _detailInfo.article;
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView mentorReplyCommentCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionMentorReplyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mentorReplyCell"];
    NSInteger index = indexPath.row / 2;
    SolveAnswerInfo *info = [_detailInfo.answerArray objectAtIndex:index];
    cell.answerInfo = info;
    if( [[cell.chooseButton allTargets] count] < 1 )
        [cell.chooseButton addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.chooseButton.enabled = [self.loginInfo isStudent];
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView mentorReplyCommentScoreCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionMentorReplyScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mentorReplyScoreCell"];
    NSInteger index = indexPath.row / 2;
    SolveAnswerInfo *info = [_detailInfo.answerArray objectAtIndex:index];
    cell.answerInfo = info;
    
    for(UIButton *btn in cell.actionButtons ){
        btn.enabled = [self.loginInfo isStudent];
        if( [[btn allTargets] count] < 1 )
            [btn addTarget:self action:@selector(scoreAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView commentCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionReplyCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    ReplyCommentInfo *info = [_detailInfo.replyArray objectAtIndex:indexPath.row];
    cell.replyInfo = info;
    if( [[cell.likeButton allTargets] count] < 1 )
        [cell.likeButton addTarget:self action:@selector(likeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if( indexPath.section == 0 ){
        cell = [self tableView:tableView questionTextCellForRowAtIndexPath:indexPath];
    }
    else if( indexPath.section == 1){
        if( (indexPath.row % 2) == 0 )
            cell = [self tableView:tableView mentorReplyCommentCellForRowAtIndexPath:indexPath];
        else if( (indexPath.row % 2) == 1 )
            cell = [self tableView:tableView mentorReplyCommentScoreCellForRowAtIndexPath:indexPath];
    }
    else{
        cell = [self tableView:tableView commentCellForRowAtIndexPath:indexPath];
    }
    
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if( section != 2 )
        return nil;
    
    NSArray *viewArray = [[NSBundle mainBundle] loadNibNamed:@"SectionHeader" owner:nil options:nil];
    UIView *headerView = [viewArray firstObject];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if( section != 2 )
        return 0.0;
    
    return 47.0;
}

#pragma mark - UITableViewDelegate

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
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - action method

- (void)likeAction:(UIButton*)button
{
    NSIndexPath *indexPath = [_tableView indexPathForCell:[Utility findSuperViewIsUITableViewCell:button]];
    if( indexPath == nil )
        return;
    
    ReplyCommentInfo *info = [_detailInfo.replyArray objectAtIndex:indexPath.row];
    info.isSelectLike = !info.isSelectLike;
    if( info.isSelectLike )
        info.likeCount = @( [info.likeCount integerValue]+1);
    else
        info.likeCount = @( [info.likeCount integerValue]-1);
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)scoreAction:(UIButton*)button
{
    QuestionMentorReplyScoreTableViewCell *cell = [Utility findSuperViewIsUITableViewCell:button];
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    if( indexPath == nil )
        return;
    
    NSInteger index = indexPath.row/2;
    SolveAnswerInfo *info = [_detailInfo.answerArray objectAtIndex:index];
    NSInteger buttonIndex = [cell.actionButtons indexOfObject:button];
    info.score = @(buttonIndex);
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)chooseAction:(UIButton*)button
{
    NSIndexPath *indexPath = [_tableView indexPathForCell:[Utility findSuperViewIsUITableViewCell:button]];
    if( indexPath == nil )
        return;
    
    NSInteger index = indexPath.row/2;
    SolveAnswerInfo *info = [_detailInfo.answerArray objectAtIndex:index];
    info.isChoosen = !info.isChoosen;
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (IBAction)resignAllAction
{
    [_commentTextField resignFirstResponder];
}

- (IBAction)commentAction:(id)sender {
    [self resignAllAction];
    
    NSString *text = [_commentTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if( [text length] < 1 ){
        return;
    }
    
    [self requestAddReplyCommentWithText:text];
}

@end
