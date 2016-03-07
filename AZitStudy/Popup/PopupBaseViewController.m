//
//  PopupBaseViewController.m
//
//  Created by coanyaa on 2014. 11. 21..
//  Copyright (c) 2014년 Joy2x. All rights reserved.
//

#import "PopupBaseViewController.h"
#import "AppDelegate.h"

@interface PopupBaseViewController ()
@property (strong, nonatomic) UIViewController *parentVC;
@end

@implementation PopupBaseViewController

+ (void)hideAllPopupAnimated:(BOOL)animated
{
    NSMutableArray *popupArray = [PopupBaseViewController popupArray];
    for(PopupBaseViewController *popupVC in popupArray ){
        [popupVC hideAnimated:animated];
    }
}

+ (NSMutableArray *)popupArray
{
    static NSMutableArray *array = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        array = [NSMutableArray array];
    });
    
    return array;
}

- (void)addToPopupArray
{
    NSMutableArray *popupArray = [PopupBaseViewController popupArray];
    NSInteger index = [popupArray indexOfObject:self];
    if( index != NSNotFound )
        return;
    [popupArray addObject:self];
}

- (void)removeFromPopupArray
{
    NSMutableArray *popupArray = [PopupBaseViewController popupArray];
    [popupArray removeObject:self];
}

- (BOOL)isExistsPopupArray
{
    NSMutableArray *popupArray = [PopupBaseViewController popupArray];
    NSInteger index = [popupArray indexOfObject:self];
    return ( index != NSNotFound );
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _cancelButtonIndex = -1;
    _firstOtherButtonIndex = 0;
    self.view.userInteractionEnabled = YES;
    
    self.animationDuration = 0.25;
    self.selectedButtonIndex = self.cancelButtonIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)cancelButtonIndex
{
    return _cancelButtonIndex;
}

- (NSInteger)firstOtherButtonIndex
{
    return _firstOtherButtonIndex;
}

#pragma mark - animattion method
- (void)popupShowAnimationWillStart
{
    self.view.alpha = 0.0;
}

- (void)popupShowAnimate
{
    self.view.alpha = 1.0;
}

- (void)popupShowAnimationEnd
{
    
}

- (void)popupHideAnimateWillStart
{
    
}

- (void)popupHideAnimate
{
    self.view.alpha = 0.0;
}

- (void)popupHideAnimationEnd
{
    
}


#pragma mark - control method
- (void)showAnimated:(BOOL)animated
{
    UIView *rootView = [AppDelegate appDelegate].window.rootViewController.view;
    if( ![self.view isDescendantOfView:rootView] ){
        if( [self isExistsPopupArray] ){
            [self hideAnimated:NO];
        }
        [self addToPopupArray];
        self.view.frame = rootView.bounds;
        [rootView addSubview:self.view];
        [self viewWillAppear:animated];
        [self popupShowAnimationWillStart];
        [UIView animateWithDuration:( animated ? self.animationDuration : 0.0) animations:^{
            [self popupShowAnimate];
        } completion:^(BOOL finished) {
            [self viewDidAppear:animated];
            [self popupShowAnimationEnd];
        }];
    }
}

- (void)showFromViewController:(UIViewController*)viewController animated:(BOOL)animated
{
    UIView *rootView = viewController.view;
    if( ![self.view isDescendantOfView:rootView] ){
        if( [self isExistsPopupArray] ){
            [self hideAnimated:NO];
        }
        self.parentVC = viewController;
        [self addToPopupArray];
        self.view.frame = rootView.bounds;
        [rootView addSubview:self.view];
        [self viewWillAppear:animated];
        [self popupShowAnimationWillStart];
        [UIView animateWithDuration:( animated ? self.animationDuration : 0.0) animations:^{
            [self popupShowAnimate];
        } completion:^(BOOL finished) {
            [self viewDidAppear:animated];
            [self popupShowAnimationEnd];
        }];
    }
}

- (void)showFromViewController:(UIViewController *)viewController atFrame:(CGRect)atFrame animated:(BOOL)animated
{
    UIView *rootView = viewController.view;
    if( ![self.view isDescendantOfView:rootView] ){
        if( [self isExistsPopupArray] ){
            [self hideAnimated:NO];
        }
        self.parentVC = viewController;
        [self addToPopupArray];
        self.view.frame = atFrame;
        [rootView addSubview:self.view];
        [self viewWillAppear:animated];
        [self popupShowAnimationWillStart];
        [UIView animateWithDuration:( animated ? self.animationDuration : 0.0) animations:^{
            [self popupShowAnimate];
        } completion:^(BOOL finished) {
            [self viewDidAppear:animated];
            [self popupShowAnimationEnd];
        }];
    }
}

- (void)hideAnimated:(BOOL)animated
{
    UIView *rootView = [AppDelegate appDelegate].window.rootViewController.view;
    if( self.parentVC )
        rootView = self.parentVC.view;
    if( [self.view isDescendantOfView:rootView] ){
        [self viewWillDisappear:animated];
        [self popupHideAnimateWillStart];
        [UIView animateWithDuration:( animated ? self.animationDuration : 0.0) animations:^{
            [self popupHideAnimate];
        } completion:^(BOOL finished) {
            [self viewDidDisappear:animated];
            [self popupHideAnimationEnd];
            [self.view removeFromSuperview];
            if( self.delegate ){
                if( [self.delegate respondsToSelector:@selector(didClosePopupViewController:buttonIndex:)])
                    [self.delegate didClosePopupViewController:self buttonIndex:self.selectedButtonIndex];
                else if( [self.delegate respondsToSelector:@selector(didClosePopupViewController:)] )
                    [self.delegate didClosePopupViewController:self];
            }
            self.parentVC = nil;
            [self removeFromPopupArray];
        }];
    }
    else{
        self.parentVC = nil;
        [self removeFromPopupArray];
    }
}

- (IBAction)closePopupAction:(id)sender
{
    if( self.navigationController )
        [self.navigationController popViewControllerAnimated:YES];
    else
        [self hideAnimated:YES];
}

@end
