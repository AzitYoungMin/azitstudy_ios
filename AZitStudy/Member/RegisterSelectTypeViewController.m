//
//  RegisterSelectTypeViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "RegisterSelectTypeViewController.h"
#import "RegisterMemberInputAccountViewController.h"
#import "RegisterMemberMentor.h"
#import "RegisterMemberStudent.h"
#import "RegisterMemberTeacher.h"

@interface RegisterSelectTypeViewController ()

@end

@implementation RegisterSelectTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)studentAction:(id)sender {
    [self moveToInputAccountWithType:MemberType_Student];
}

- (IBAction)mentorAction:(id)sender {
    [self moveToInputAccountWithType:MemberType_Mentor];
}

- (IBAction)teacherAction:(id)sender {
    [self moveToInputAccountWithType:MemberType_Teacher];
}

- (void)moveToInputAccountWithType:(NSInteger)type
{
    RegisterMemberInputAccountViewController *nextVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"RegisterMemberInputAccountViewController"];
    nextVC.memberType = type;
    if( type == MemberType_Student )
        nextVC.memberInfo = [[RegisterMemberStudent alloc] init];
    else if( type == MemberType_Mentor )
        nextVC.memberInfo = [[RegisterMemberMentor alloc] init];
    else if( type == MemberType_Teacher )
        nextVC.memberInfo = [[RegisterMemberTeacher alloc] init];
    
    [self.navigationController pushViewController:nextVC animated:YES];
}
@end
