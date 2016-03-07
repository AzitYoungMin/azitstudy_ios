//
//  SubjectPieChartTableViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SHPieChartView.h>

@class SubjectGraphInfo;
@interface SubjectPieChartTableViewCell : UITableViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    
    IBOutlet NSLayoutConstraint *_collectionViewHeightLayout;
}

@property (strong, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) IBOutlet SHPieChartView *pieChartView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) SubjectGraphInfo *graphInfo;

@end
