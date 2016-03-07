//
//  InputBaseViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "InputBaseViewController.h"

@interface InputBaseViewController ()

@end

@implementation InputBaseViewController

- (void)notifyKeyboardWillShow:(NSNotification*)noti
{
    self.keyboardFrame = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyboardAnimationDuration = [[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:self.keyboardAnimationDuration animations:^{
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, self.keyboardFrame.size.height, 0);
    }];
}

- (void)notifyKeyboardWillHide:(NSNotification*)noti
{
    [UIView animateWithDuration:self.keyboardAnimationDuration animations:^{
        _tableView.contentInset = UIEdgeInsetsZero;
    }];
}

- (void)scrollToInputView:(UIView*)inputView
{
    CGRect rect = [inputView.superview convertRect:inputView.frame toView:self.view];
    CGRect intersect = CGRectIntersection(rect, self.keyboardFrame);
    if( !CGRectIsNull(intersect) ){
        [_tableView setContentOffset:CGPointMake(0, self.keyboardFrame.size.height - intersect.size.height - inputView.frame.size.height) animated:YES];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    CGRect appFrame = [[UIScreen mainScreen] bounds];
    CGFloat contentsHeight = appFrame.size.height - ( self.naviView ? self.naviView.frame.size.height : 0.0 );
    if( _headerView.frame.size.height < contentsHeight ){
        _headerView.frame = CGRectMake(0, 0, appFrame.size.width ,contentsHeight);
        _tableView.tableHeaderView = nil;
        _tableView.tableHeaderView = _headerView;
    }
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignAllAction)];
    [_tableView addGestureRecognizer:tapGesture];
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

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self scrollToInputView:textField];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

#pragma mark - action method
- (IBAction)resignAllAction
{
    for( UITextField *textField in self.inputFields)
        [textField resignFirstResponder];
}

@end
