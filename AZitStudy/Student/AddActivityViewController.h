//
//  AddActivityViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "PopupBaseViewController.h"

@class MenuInfo;
@interface AddActivityViewController : PopupBaseViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate>{
    
    IBOutlet UICollectionView *_typeCollectionView;
    IBOutlet UICollectionView *_iconCollectionView;
    IBOutlet UITextField *_inputTextField;
    IBOutlet NSLayoutConstraint *_contentsViewTopLayout;
    IBOutlet UIView *_contentsView;
}

@property (strong, nonatomic) NSArray *currentActArray;
@property (strong, nonatomic) MenuInfo *actInfo;

@end
