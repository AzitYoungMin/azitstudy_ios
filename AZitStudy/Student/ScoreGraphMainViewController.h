//
//  ScoreGraphMainViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface ScoreGraphMainViewController : BaseViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource>{
    
    IBOutlet UICollectionView *_collectionView;
    IBOutlet UITableView *_tableView;
    IBOutlet UIView *_footerView;
}

@property (assign, nonatomic) BOOL isShowDetailButton;

@end
