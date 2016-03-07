//
//  ActivityTypeCollectionViewCell.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuInfo;
@interface ActivityTypeCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UIView *titleBaseView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) MenuInfo *itemInfo;

@end
