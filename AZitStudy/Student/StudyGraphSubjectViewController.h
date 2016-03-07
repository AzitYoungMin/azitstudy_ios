//
//  StudyGraphSubjectViewController.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "BaseViewController.h"

@interface StudyGraphSubjectViewController : BaseViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate>{
    
    IBOutlet UICollectionView *_collectionView;
    IBOutlet UITableView *_tableView;
    IBOutlet UILabel *_subjectLabel;
    IBOutlet UILabel *_studyTimeLabel;
    IBOutlet UILabel *_topRankLabel;
    IBOutlet UIView *_footerView;
}

@property (assign, nonatomic) BOOL isShowDetailButton;

@end
