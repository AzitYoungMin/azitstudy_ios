//
//  BaseViewController.h
//
//  Created by coanyaa on 2015. 5. 10..
//  Copyright (c) 2015년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIColor+Hex.h>
#import <UIImageView+AFNetworking.h>
#import <UIAlertView+Blocks.h>
#import <AFNetworkReachabilityManager.h>
#import <CocoaSecurity.h>
#import "Common.h"
#import "Utility.h"
#import "DateHelper.h"
#import "AppDelegate.h"
#import "LoginInfo.h"
#import "ProfileInfo.h"
#import "MentorProfilInfo.h"
#import "TeacherProfileInfo.h"
#import "HTTPAPICommunicator.h"
#import "UIViewController+ToastMessage.h"
#import "UIImageView+ImageCache.h"
#import "UIButton+ImageCache.h"


@interface BaseViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *naviLeftButton;
@property (strong, nonatomic) IBOutlet UIButton *naviRightButton;
@property (strong, nonatomic) IBOutlet UILabel *naviTitleLabel;
@property (strong, nonatomic) IBOutlet UIView *naviView;
@property (assign, nonatomic) CGFloat viewScreenRate;
@property (strong, nonatomic) IBOutlet UIButton* reserveButton;
@property (strong, nonatomic) LoginInfo *loginInfo;
@property (strong, nonatomic) id profileInfo;

- (void)setupView;
- (void)setNaviLeftButtonTitle:(NSString*)title;
- (void)naviRightMoreButton;
- (void)naviRightButtonDone;
- (void)naviRightButtonHidden:(BOOL)hidden;

- (IBAction)closeAction:(id)sender;
- (IBAction)backAction:(id)sender;
- (IBAction)doneAction:(id)sender;
- (IBAction)moreAction:(id)sender;

- (UIImage*)cachedImageFromURL:(NSURL*)imageURL;
- (void)updateLoginInfo;

@end
