//
//  StudyGraphContainerViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "StudyGraphContainerViewController.h"
#import "StudyGraphMainViewController.h"
#import "StudyGraphSubjectViewController.h"

@interface StudyGraphContainerViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (strong, nonatomic) UIPageViewController  *pageVC;
@property (strong, nonatomic) NSMutableArray *viewControllers;
@end

@implementation StudyGraphContainerViewController

- (void)setupView
{
    [super setupView];
    
    if( [_tabButtons indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = (UIButton*)obj;
        if( button.selected ){
            *stop = YES;
            return YES;
        }
        return NO;
    }] == NSNotFound ){
        [self tabChangeAction:[_tabButtons firstObject]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    StudyGraphMainViewController *studyVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"StudyGraphMainViewController"];
    StudyGraphSubjectViewController *subjectVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"StudyGraphSubjectViewController"];
    studyVC.isShowDetailButton = self.isShowDetailButton;
    subjectVC.isShowDetailButton = self.isShowDetailButton;
    self.viewControllers = [NSMutableArray arrayWithArray:@[studyVC,subjectVC]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if( [segue.identifier isEqualToString:@"pageVC"] ){
        self.pageVC = segue.destinationViewController;
        _pageVC.dataSource = self;
        _pageVC.delegate = self;
        for (UIScrollView *view in self.pageVC.view.subviews) {
            if ([view isKindOfClass:[UIScrollView class]]) {
                view.scrollEnabled = NO;
            }
        }
    }
}

#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if( index == 0 )
        return nil;
    return [self.viewControllers objectAtIndex:index-1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    if( (index+1) >= [self.viewControllers count] )
        return nil;
    return [self.viewControllers objectAtIndex:index+1];
}

#pragma mark - UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    UIViewController *targetVC = [pageViewController.viewControllers firstObject];
    NSInteger targetIndex = [_viewControllers indexOfObject:targetVC];
    UIButton *button = [_tabButtons objectAtIndex:targetIndex];
    [self selectTabButton:button];
}

#pragma mark - action method
- (void)selectTabButton:(UIButton*)button
{
    for(UIButton *btn in _tabButtons){
        btn.selected = NO;
        btn.backgroundColor = [UIColor colorWithHex:0xb2b2b2];
    }
    button.selected = YES;
    button.backgroundColor = [UIColor colorWithHex:0xefefef];
}

- (IBAction)tabChangeAction:(id)sender {
    UIButton *button = (UIButton*)sender;
    
    if( button.selected )
        return;
    
    [self selectTabButton:button];
    
    NSInteger index = [_tabButtons indexOfObject:button];
    UIViewController *currentVC = [_pageVC.viewControllers firstObject];
    UIViewController *targetVC = [_viewControllers objectAtIndex:index];
    NSInteger currentIndex = [_viewControllers indexOfObject:currentVC];
    
    [_pageVC setViewControllers:@[targetVC] direction:(currentIndex > index ? UIPageViewControllerNavigationDirectionReverse : UIPageViewControllerNavigationDirectionForward) animated:YES completion:nil];
}


@end
