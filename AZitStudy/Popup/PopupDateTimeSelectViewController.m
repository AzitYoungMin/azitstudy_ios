//
//  PopupDateTimeSelectViewController.m
//  GangnamSister
//
//  Created by coanyaa on 2015. 9. 30..
//  Copyright © 2015년 Joy2x. All rights reserved.
//

#import "PopupDateTimeSelectViewController.h"
#import "Common.h"
#import "Utility.h"
#import "DateHelper.h"

@interface PopupDateTimeSelectViewController ()

@end

@implementation PopupDateTimeSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if( self.startDate )
        _datePicker.date = self.startDate;
    else
        _datePicker.date = [NSDate date];
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
#pragma mark - override method
- (void)popupShowAnimationWillStart
{
    [super popupHideAnimateWillStart];
    _contentBottomLayout.constant = -self.contentView.frame.size.height;
    [self.view layoutIfNeeded];
    _contentBottomLayout.constant = 0.0;
}

- (void)popupShowAnimate
{
    [super popupShowAnimate];
    [self.view layoutIfNeeded];
    
}

- (void)popupShowAnimationEnd
{
    
}

- (void)popupHideAnimateWillStart
{
    _contentBottomLayout.constant = -self.contentView.frame.size.height;
}

- (void)popupHideAnimate
{
    [self.view layoutIfNeeded];
}

- (void)popupHideAnimationEnd
{
    
}

#pragma mark - action method
- (void)setMinimumDate:(NSDate *)minimumDate
{
    if( _datePicker )
        _datePicker.minimumDate = minimumDate;
}

- (void)setStartDate:(NSDate *)startDate
{
    if( _datePicker )
        _datePicker.date = self.startDate;
}

- (IBAction)doneAction:(id)sender {
    _selectedDate = _datePicker.date;
    self.selectedButtonIndex = self.firstOtherButtonIndex;
    if( self.delegate && [self.delegate respondsToSelector:@selector(popupViewController:didSelectButtonIndex:)])
        [self.delegate popupViewController:self didSelectButtonIndex:self.selectedButtonIndex];
    else
        [self closePopupAction:nil];
}

@end
