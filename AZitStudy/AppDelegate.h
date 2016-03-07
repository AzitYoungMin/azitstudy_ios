//
//  AppDelegate.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 1. 9..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginInfo;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate*)appDelegate;

+ (id)viewControllerFromIntroWithIdentifier:(NSString*)identifier;
+ (id)viewControllerFromMainWithIdentifier:(NSString*)identifier;
+ (id)viewControllerFromMemberWithIdentifier:(NSString*)identifier;
+ (id)viewControllerFromSettingsWithIdentifier:(NSString*)identifier;
+ (id)viewControllerFromMentoWithIdentifier:(NSString*)identifier;
+ (id)viewControllerFromStudentWithIdentifier:(NSString*)identifier;
+ (id)viewControllerFromTeacherWithIdentifier:(NSString*)identifier;
+ (id)viewControllerFromPopupWithIdentifier:(NSString*)identifier;

- (LoginInfo*)loginUserInfo;
- (void)loginWithInfo:(LoginInfo*)info;
- (void)logout;

- (id)profileInfo;
- (void)setProfileInfo:(id)info;

- (void)moveToLogin;
- (void)moveToMentor;
- (void)moveToStudent;
- (void)moveToTeacher;

@end

