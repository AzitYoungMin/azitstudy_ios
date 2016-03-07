//
//  FindPasswordViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 2..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "FindPasswordViewController.h"

@interface FindPasswordViewController ()

@end

@implementation FindPasswordViewController

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
#pragma mark - action method

- (IBAction)findPasswordAction:(id)sender {
    [self resignAllAction];
    NSString *emailStr = [_emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if( [emailStr length] < 1){
        [self showToastMessage:@"이메일을 입력해 주세요."];
        return;
    }
    
    [HTTPAPICommunicator sharedInstance].isShowProgress = YES;
    [[HTTPAPICommunicator sharedInstance] findPasswordForEmail:emailStr success:^(ResultInfo *response, id responseObject) {
        if( response.isSuccess ){
            [UIAlertView showWithTitle:nil message:response.message cancelButtonTitle:@"확인" otherButtonTitles:nil tapBlock:^(UIAlertView * _Nonnull alertView, NSInteger buttonIndex) {
                [self backAction:nil];
            }];
        }
        else
            [self showToastMessage:response.message];
    } failure:^(NSError *error, NSHTTPURLResponse *response) {

    }];
}

@end
