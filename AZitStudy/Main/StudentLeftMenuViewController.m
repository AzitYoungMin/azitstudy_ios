//
//  StudentLeftMenuViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 23..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "StudentLeftMenuViewController.h"
#import "MenuInfo.h"

@interface StudentLeftMenuViewController ()
@property (strong, nonatomic) NSArray *itemArray;
@end

@implementation StudentLeftMenuViewController

- (void)popupShowAnimationWillStart
{
    _contentViewLeadingLayout.constant = 0.0;
}

- (void)popupShowAnimate
{
    [self.view layoutIfNeeded];
}

- (void)popupHideAnimateWillStart
{
    _contentViewLeadingLayout.constant = -self.contentView.frame.size.width;
}

- (void)popupHideAnimate
{
    [self.view layoutIfNeeded];
}

- (void)updateProfileInfo
{
    _userTypeLabel.text = [self.loginInfo userTypeString];
    if( self.profileInfo ){
        ProfileInfo *info = (ProfileInfo*)self.profileInfo;
        if( [info.profileImage length] > 0 ){
            [_profileImageButton setImageForState:UIControlStateNormal imageURL:[[HTTPAPICommunicator sharedInstance] remoteImageURLWithPath:info.profileImage] placeholderImage:[UIImage imageNamed:@"icon_join_mentor"]];
        }
        else
            [_profileImageButton setImage:[UIImage imageNamed:@"icon_join_mentor"] forState:UIControlStateNormal];
        if( [self.loginInfo isStudent] ){
            _studentInfoView.hidden = NO;
            _profileArrowButton.hidden = NO;
            _mentorInfoView.hidden = YES;
            _mentorPointView.hidden = YES;
            _nameLabel.text = info.name;
            _goalSchoolLabel.text = [NSString stringWithFormat:@"목표대학 : %@",info.targetUniversity];
            _profileViewHeightLayout.constant = 137.0;
            
        }
        else if( [self.loginInfo isMentor] ){
            _studentInfoView.hidden = YES;
            _profileArrowButton.hidden = YES;
            _mentorInfoView.hidden = NO;
            _mentorPointView.hidden = NO;
            MentorProfilInfo *mentorProfile = (MentorProfilInfo*)info;
            _mentorNameLabel.text = mentorProfile.name;
            _mentorCommentLabel.text = mentorProfile.introduce;
            _mentorPointLabel.text = [NSString stringWithFormat:@"0pt"];
            _profileViewHeightLayout.constant = 185.0;
        }
        [self.view layoutIfNeeded];
    }
}

- (void)setupView
{
    [super setupView];
    [self updateProfileInfo];
    [_tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _profileImageButton.layer.cornerRadius = _profileImageButton.frame.size.height*0.5;
    _profileImageButton.layer.masksToBounds = YES;
    _contentViewLeadingLayout.constant = -self.contentView.frame.size.width;
    _contentViewWidthLayout.constant *= self.viewScreenRate;
    [self.view layoutIfNeeded];
    
    if( [self.loginInfo isStudent] ){
        self.itemArray = @[
                           [[MenuInfo alloc] initWithTitle:@"홈" type:LeftMenuType_Home imageName:@"icon_navi_1" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"나의 학습 분석" type:LeftMenuType_AnalyzeStudy imageName:@"icon_navi_2" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"나의 성적 분석" type:LeftMenuType_AnalyzeScore imageName:@"icon_navi_3" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"멘토만나기" type:LeftMenuType_MeetMentor imageName:@"icon_navi_4" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"풀어주세요" type:LeftMenuType_Solve imageName:@"icon_navi_5" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"맞춤리포트" type:LeftMenuType_Report imageName:@"icon_navi_6" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"문의하기" type:LeftMenuType_Question imageName:@"icon_navi_8" object:nil],
                           /*[[MenuInfo alloc] initWithTitle:@"초대하기" type:LeftMenuType_Invite imageName:@"icon_navi_1" object:nil],*/
                           [[MenuInfo alloc] initWithTitle:@"설정" type:LeftMenuType_Settings imageName:@"icon_navi_7" object:nil]
                           ];
    }
    else if( [self.loginInfo isMentor] ){
        self.itemArray = @[
                           [[MenuInfo alloc] initWithTitle:@"홈" type:LeftMenuType_Home imageName:@"icon_navi_1" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"멘토링 답변" type:LeftMenuType_MentoringReply imageName:@"icon_navi_4" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"풀어주세요" type:LeftMenuType_Solve imageName:@"icon_navi_5" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"설정" type:LeftMenuType_Settings imageName:@"icon_navi_7" object:nil],
                           [[MenuInfo alloc] initWithTitle:@"문의하기" type:LeftMenuType_Question imageName:@"icon_navi_8" object:nil]
                           /*,[[MenuInfo alloc] initWithTitle:@"초대하기" type:LeftMenuType_Invite imageName:@"icon_navi_1" object:nil]*/
                           
                           ];
    }
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    MenuInfo *info = [_itemArray objectAtIndex:indexPath.row];
    cell.textLabel.text = info.title;
    cell.imageView.image = [UIImage imageNamed:info.imageName];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MenuInfo *info = [_itemArray objectAtIndex:indexPath.row];
    self.selectedButtonIndex = self.firstOtherButtonIndex + info.type;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
    else
        [self hideAnimated:YES];
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

- (IBAction)pointAction:(id)sender {
    self.selectedButtonIndex = self.firstOtherButtonIndex + LeftMenuType_Point;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
}

- (IBAction)profileAction:(id)sender {
    self.selectedButtonIndex = self.firstOtherButtonIndex + LeftMenuType_EditProfile;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
}

@end
