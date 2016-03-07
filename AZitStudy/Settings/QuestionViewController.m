//
//  QuestionViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 25..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <MessageUI/MessageUI.h>
#import "QuestionViewController.h"

@interface QuestionViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation QuestionViewController

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

#pragma mark - MFMailComposeViewControllerDelegate
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - action method

- (IBAction)kakaoAction:(id)sender {
}


- (IBAction)emailAction:(id)sender {
    MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
    mailVC.mailComposeDelegate = self;
    [mailVC setCcRecipients:@[@"info@azitstudy.com"]];
    [self presentViewController:mailVC animated:YES completion:nil];
}

@end
