//
//  SubjectChartLegendCollectionViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SubjectPieCartInfo;
@interface SubjectChartLegendCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIView *colorBoxView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) SubjectPieCartInfo *chartInfo;

@end
