//
//  AnalyzeMainViewController.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "AnalyzeMainViewController.h"
#import "StudyGraphContainerViewController.h"
#import "ScoreGraphMainViewController.h"

@interface AnalyzeMainViewController ()<UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (strong, nonatomic) UIPageViewController *pageVC;
@property (strong, nonatomic) NSMutableArray *viewControllers;
@end

@implementation AnalyzeMainViewController

- (void)setupView
{
    [super setupView];

    if( _tabSegmentCtrl.selectedSegmentIndex < 0 ){
        [_tabSegmentCtrl setSelectedSegmentIndex: ( self.startIndex ? [self.startIndex integerValue] : 0)];
        [self segmentChangeAction:_tabSegmentCtrl];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    StudyGraphContainerViewController *studyVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"StudyGraphContainerViewController"];
    ScoreGraphMainViewController *scoreVC = [AppDelegate viewControllerFromStudentWithIdentifier:@"ScoreGraphMainViewController"];
    studyVC.isShowDetailButton = self.isShowDetailButton;
    scoreVC.isShowDetailButton = self.isShowDetailButton;
    self.viewControllers = [NSMutableArray arrayWithArray:@[studyVC,scoreVC]];
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
    _tabSegmentCtrl.selectedSegmentIndex = targetIndex;
}

#pragma mark - action method
- (IBAction)segmentChangeAction:(id)sender {
    NSInteger index = _tabSegmentCtrl.selectedSegmentIndex;
    UIViewController *currentVC = [_pageVC.viewControllers firstObject];
    UIViewController *targetVC = [_viewControllers objectAtIndex:index];
    NSInteger currentIndex = [_viewControllers indexOfObject:currentVC];
    
    [_pageVC setViewControllers:@[targetVC] direction:(currentIndex > index ? UIPageViewControllerNavigationDirectionReverse : UIPageViewControllerNavigationDirectionForward) animated:YES completion:nil];
}

@end
