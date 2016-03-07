//
//  MentorLeftMenuViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 23..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "MentorLeftMenuViewController.h"

@interface MentorLeftMenuViewController ()

@end

@implementation MentorLeftMenuViewController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _contentViewLeadingLayout.constant = -self.contentView.frame.size.width;
    [self.view layoutIfNeeded];
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
- (IBAction)menteeAction:(id)sender {
    self.selectedButtonIndex = self.firstOtherButtonIndex;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
    else
        [self hideAnimated:YES];
}

- (IBAction)solveAction:(id)sender {
    self.selectedButtonIndex = self.firstOtherButtonIndex+1;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
    else
        [self hideAnimated:YES];
}

- (IBAction)settingAction:(id)sender {
    self.selectedButtonIndex = self.firstOtherButtonIndex+2;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
    else
        [self hideAnimated:YES];
}

- (IBAction)questionAction:(id)sender {
    self.selectedButtonIndex = self.firstOtherButtonIndex+3;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
    else
        [self hideAnimated:YES];
}

@end
