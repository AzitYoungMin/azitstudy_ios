//
//  SolveQuestionViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface SolveQuestionViewController : BaseViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UITableView *_tableView;
    IBOutlet UICollectionView *_collectionView;
    IBOutlet UIView *_underbarView;
    IBOutlet NSLayoutConstraint *_underbarViewLeadingLayout;
    IBOutlet NSLayoutConstraint *_underbarViewWidthLayout;
}

@end
