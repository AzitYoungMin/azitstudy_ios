//
//  AppDelegate.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 1. 9..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "AppDelegate.h"
#import "Common.h"
#import "Utility.h"
#import "LoginInfo.h"
#import "LoginViewController.h"
#import "MentorHomeViewController.h"
#import "TeacherHomeViewController.h"
#import "StudentHomeViewController.h"
#import "ProfileInfo.h"

@interface AppDelegate ()
@property (strong, nonatomic) UIStoryboard *introStoryboard;
@property (strong, nonatomic) UIStoryboard *mainStoryboard;
@property (strong, nonatomic) UIStoryboard *memberStoryboard;
@property (strong, nonatomic) UIStoryboard *settingsStoryboard;
@property (strong, nonatomic) UIStoryboard *mentoStoryboard;
@property (strong, nonatomic) UIStoryboard *studentStoryboard;
@property (strong, nonatomic) UIStoryboard *teacherStoryboard;
@property (strong, nonatomic) UIStoryboard *popupStoryboard;
@property (strong, nonatomic) LoginInfo *loginInfo;
@property (strong, nonatomic) id userProfileInfo;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.introStoryboard = [UIStoryboard storyboardWithName:@"Intro" bundle:nil];
    self.mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.memberStoryboard = [UIStoryboard storyboardWithName:@"Member" bundle:nil];
    self.settingsStoryboard = [UIStoryboard storyboardWithName:@"Settings" bundle:nil];
    self.mentoStoryboard = [UIStoryboard storyboardWithName:@"Mento" bundle:nil];
    self.studentStoryboard = [UIStoryboard storyboardWithName:@"Student" bundle:nil];
    self.teacherStoryboard = [UIStoryboard storyboardWithName:@"Teacher" bundle:nil];
    self.popupStoryboard = [UIStoryboard storyboardWithName:@"Popup" bundle:nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - class method
+ (AppDelegate*)appDelegate
{
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

+ (id)viewControllerFromIntroWithIdentifier:(NSString*)identifier
{
    return [[AppDelegate appDelegate].introStoryboard instantiateViewControllerWithIdentifier:identifier];
}

+ (id)viewControllerFromMainWithIdentifier:(NSString*)identifier
{
    return [[AppDelegate appDelegate].mainStoryboard instantiateViewControllerWithIdentifier:identifier];
}

+ (id)viewControllerFromMemberWithIdentifier:(NSString*)identifier
{
    return [[AppDelegate appDelegate].memberStoryboard instantiateViewControllerWithIdentifier:identifier];
}

+ (id)viewControllerFromSettingsWithIdentifier:(NSString*)identifier
{
    return [[AppDelegate appDelegate].settingsStoryboard instantiateViewControllerWithIdentifier:identifier];
}

+ (id)viewControllerFromMentoWithIdentifier:(NSString*)identifier
{
    return [[AppDelegate appDelegate].mentoStoryboard instantiateViewControllerWithIdentifier:identifier];
}

+ (id)viewControllerFromStudentWithIdentifier:(NSString*)identifier
{
    return [[AppDelegate appDelegate].studentStoryboard instantiateViewControllerWithIdentifier:identifier];
}

+ (id)viewControllerFromTeacherWithIdentifier:(NSString*)identifier
{
    return [[AppDelegate appDelegate].teacherStoryboard instantiateViewControllerWithIdentifier:identifier];
}

+ (id)viewControllerFromPopupWithIdentifier:(NSString*)identifier
{
    return [[AppDelegate appDelegate].popupStoryboard instantiateViewControllerWithIdentifier:identifier];
}

#pragma mark - login
- (LoginInfo*)loginUserInfo
{
    return self.loginInfo;
}
- (void)loginWithInfo:(LoginInfo*)info
{
    self.loginInfo = info;
    [HTTPAPICommunicator sharedInstance].accessToken = info.userSecret;
}

- (void)logout
{
    self.loginInfo = nil;
    [HTTPAPICommunicator sharedInstance].accessToken = nil;
    [self setProfileInfo:nil];
}

#pragma mark - profile
- (id)profileInfo
{
    return self.loginInfo.profileInfo;
}

- (void)setProfileInfo:(id)info
{
    if( self.loginInfo )
        self.loginInfo.profileInfo = info;
}

#pragma mark - move view
- (void)moveToLogin
{
    UINavigationController *navCtrl = self.window.rootViewController;
    LoginViewController *loginVC = [AppDelegate viewControllerFromMemberWithIdentifier:@"LoginViewController"];
    [navCtrl setViewControllers:@[loginVC] animated:YES];
}

- (void)moveToMentor
{
    UINavigationController *navCtrl = self.window.rootViewController;
    MentorHomeViewController *homeVC = [AppDelegate viewControllerFromMainWithIdentifier:@"MentorHomeViewController"];
    [navCtrl setViewControllers:@[homeVC] animated:YES];
}

- (void)moveToStudent
{
    UINavigationController *navCtrl = self.window.rootViewController;
    StudentHomeViewController *homeVC = [AppDelegate viewControllerFromMainWithIdentifier:@"StudentHomeViewController"];
    [navCtrl setViewControllers:@[homeVC] animated:YES];
}

- (void)moveToTeacher
{
    UINavigationController *navCtrl = self.window.rootViewController;
    TeacherHomeViewController *homeVC = [AppDelegate viewControllerFromMainWithIdentifier:@"TeacherHomeViewController"];
    [navCtrl setViewControllers:@[homeVC] animated:YES];
}

@end
