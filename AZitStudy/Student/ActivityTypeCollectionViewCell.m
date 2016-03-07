//
//  ActivityTypeCollectionViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "ActivityTypeCollectionViewCell.h"
#import "MenuInfo.h"

@implementation ActivityTypeCollectionViewCell

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.backgroundColor = ( selected ? [UIColor colorWithHex:0x33393d] : [UIColor whiteColor]);
    self.titleBaseView.backgroundColor = ( selected ? [UIColor clearColor] : [UIColor colorWithHex:0xdbdbdb] );
    self.titleLabel.textColor = ( selected ? [UIColor whiteColor] : [UIColor blackColor] );
}

- (void)setItemInfo:(MenuInfo *)itemInfo
{
    _itemInfo = itemInfo;
    _titleLabel.text = itemInfo.title;
    _iconImageView.image = [UIImage imageNamed:itemInfo.imageName];
}
@end
