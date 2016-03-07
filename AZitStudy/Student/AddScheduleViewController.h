//
//  AddScheduleViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "PopupBaseViewController.h"

@class ActivityInfo;
@interface AddScheduleViewController : PopupBaseViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate>{
    
    IBOutlet UICollectionView *_typeCollectionView;
    IBOutlet UICollectionView *_subjectCollectionView;
    IBOutlet UICollectionView *_bookCollectionView;
    IBOutlet UITextField *_goalTextField;
    IBOutlet UIView *_contentsView;
    IBOutlet NSLayoutConstraint *_contentsViewTopLayout;
}

@property (strong, nonatomic) NSDate *targetDate;
@property (strong, nonatomic) ActivityInfo *activityInfo;

@end
