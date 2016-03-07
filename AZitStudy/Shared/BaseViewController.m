//
//  BaseViewController.m
//
//  Created by coanyaa on 2015. 5. 10..
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)setupView
{
    if( [self.title length] > 0 )
        self.naviTitleLabel.text = self.title;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewScreenRate = [Utility screenRateByFourInchWidth];
    if( [Utility isiPhone6PlusScreen] ){
        self.reserveButton.contentEdgeInsets = UIEdgeInsetsMake(0, 30.0, 0, 12.0);
    }
    self.loginInfo = [[AppDelegate appDelegate] loginUserInfo];
    self.profileInfo = [[AppDelegate appDelegate] profileInfo];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.loginInfo = [[AppDelegate appDelegate] loginUserInfo];
    self.profileInfo = [[AppDelegate appDelegate] profileInfo];
    [self setupView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - control method
- (void)setNaviLeftButtonTitle:(NSString*)title
{
    [_naviLeftButton setTitle:[NSString stringWithFormat:@" %@",title] forState:UIControlStateNormal];
}

- (void)naviRightMoreButton
{
    [_naviRightButton setTitle:nil forState:UIControlStateNormal];
    [_naviRightButton setImage:[UIImage imageNamed:@"common_icon_more"] forState:UIControlStateNormal];
}

- (void)naviRightButtonDone
{
    [_naviRightButton setTitle:@"확인" forState:UIControlStateNormal];
    [_naviRightButton setImage:nil forState:UIControlStateNormal];
}

- (void)naviRightButtonHidden:(BOOL)hidden
{
    _naviRightButton.hidden = hidden;
}

#pragma mark - actino method
- (IBAction)closeAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backAction:(id)sender
{
    if( self.navigationController )
        [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)doneAction:(id)sender
{
    
}

- (IBAction)moreAction:(id)sender
{
    
}

- (UIImage*)cachedImageFromURL:(NSURL*)imageURL
{
    if( imageURL == nil )
        return nil;
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:imageURL cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30.0f];
    UIImage *image = [[UIImageView sharedImageCache] cachedImageForRequest:urlRequest];
    return image;
}

- (void)updateLoginInfo
{
    self.loginInfo = [[AppDelegate appDelegate] loginUserInfo];
}

#pragma mark - dummy method
- (IBAction)questionDetailAction:(id)sender {
    BaseViewController *nextVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"StudentQuestionDetailViewController"];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
