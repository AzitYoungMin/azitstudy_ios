//
//  InputStudentClassViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputStudentClassViewController.h"
#import "RegisterMemberStudent.h"

enum ClassTypeEnum {
    ClassType_Humanity,
    ClassType_Science,
};

@interface InputStudentClassViewController ()

@end

@implementation InputStudentClassViewController

- (void)setupView
{
    [super setupView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView.tableHeaderView = nil;
    _tableView.tableFooterView = nil;
    [self tabMenuAction:[_tabButtons firstObject]];
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
- (IBAction)toggleCheckAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    button.selected = !button.selected;
}


- (IBAction)mathTypeSelectAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    
    for(UIButton *btn in _mathTypeButtons)
        btn.selected = NO;
    button.selected = YES;
}

- (IBAction)tabMenuAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    
    if( button.selected )
        return;
    
    for(UIButton *btn in _tabButtons){
        btn.selected = NO;
        btn.backgroundColor = [UIColor colorWithHex:0xACB1B5];
    }
    button.selected = YES;
    button.backgroundColor = [UIColor whiteColor];
    
    NSInteger type = [_tabButtons indexOfObject:button];
    if( type == ClassType_Humanity )
        _tableView.tableHeaderView = _headerView;
    else if( type == ClassType_Science )
        _tableView.tableHeaderView = _footerView;
}


- (IBAction)doneAction:(id)sender {
    
    _memberInfo.department = @(1);
    _memberInfo.mathType = @(1);
    _memberInfo.optionalSubjects = @"60300";
    _memberInfo.foreignLanguage = @(80200);
    _memberInfo.isMpEducation = @(YES);
    _memberInfo.targetDepartments = [NSMutableArray arrayWithArray:@[@"1",@"8"]];
    
    

    [HTTPAPICommunicator sharedInstance].isShowProgress = YES;
    [HTTPAPICommunicator sharedInstance].progressMessage = @"처리중 입니다.";
    [[HTTPAPICommunicator sharedInstance] registerStudent:self.memberInfo success:^(ResultInfo *response, id responseObject) {
        if( response.isSuccess ){
            [UIAlertView showWithTitle:@"가입을 축하드립니다." message:nil cancelButtonTitle:@"확인" otherButtonTitles:nil tapBlock:^(UIAlertView * _Nonnull alertView, NSInteger buttonIndex) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }];
        }
        else{
            [self showToastMessage:@"회원가입에 실패했습니다."];
        }
    } failure:^(NSError *error, NSHTTPURLResponse *response) {
        
    }];
    
}


@end
