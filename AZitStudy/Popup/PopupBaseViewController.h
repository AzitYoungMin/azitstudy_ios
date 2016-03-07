//
//  PopupBaseViewController.h
//
//  Created by coanyaa on 2014. 11. 21..
//  Copyright (c) 2014년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@protocol PopupViewControllerDelegate;
@interface PopupBaseViewController : BaseViewController {
    NSInteger _cancelButtonIndex;
    NSInteger _firstOtherButtonIndex;
}

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (assign, nonatomic) id<PopupViewControllerDelegate> delegate;
@property (readonly, nonatomic) NSInteger cancelButtonIndex;
@property (readonly, nonatomic) NSInteger firstOtherButtonIndex;
@property (assign, nonatomic) CGFloat animationDuration;
@property (strong, nonatomic) id objectTag;
@property (assign, nonatomic) NSInteger selectedButtonIndex;

+ (void)hideAllPopupAnimated:(BOOL)animated;

- (void)showAnimated:(BOOL)animated;
- (void)showFromViewController:(UIViewController*)viewController animated:(BOOL)animated;
- (void)showFromViewController:(UIViewController *)viewController atFrame:(CGRect)atFrame animated:(BOOL)animated;
- (void)hideAnimated:(BOOL)animated;
- (IBAction)closePopupAction:(id)sender;

- (void)popupShowAnimationWillStart;
- (void)popupShowAnimate;
- (void)popupShowAnimationEnd;

- (void)popupHideAnimateWillStart;
- (void)popupHideAnimate;
- (void)popupHideAnimationEnd;
@end

@protocol PopupViewControllerDelegate <NSObject>
@optional
- (void)didClosePopupViewController:(PopupBaseViewController*)controller;
- (void)didClosePopupViewController:(PopupBaseViewController *)controller buttonIndex:(NSInteger)buttonIndex;
- (void)popupViewController:(PopupBaseViewController*)controller didSelectButtonIndex:(NSInteger)buttonIndex;
- (void)popupViewController:(PopupBaseViewController *)controller didTapAccessoryAtindex:(NSInteger)buttonIndex;

@end
