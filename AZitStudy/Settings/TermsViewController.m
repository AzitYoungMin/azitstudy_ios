//
//  TermsViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 25..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "TermsViewController.h"

@interface TermsViewController ()

@end

@implementation TermsViewController

- (void)setupView
{
    [super setupView];
    NSInteger index = [_tabButtons indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = (UIButton*)obj;
        if( button.selected ){
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    if( index == NSNotFound )
        [self tabMenuAction:[_tabButtons firstObject]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect appFrame = [[UIScreen mainScreen] bounds];
    _underbarViewWidthLayout.constant = appFrame.size.width * 0.5;
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
- (IBAction)tabMenuAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    if( button.selected )
        return;
    for(UIButton* btn in _tabButtons)
        btn.selected = NO;
    button.selected = YES;
    _titleLabel.text = [button titleForState:UIControlStateNormal];
    _underbarViewLeadingLayout.constant = button.frame.origin.x;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}


@end
