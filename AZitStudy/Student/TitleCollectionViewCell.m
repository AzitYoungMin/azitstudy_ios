//
//  TitleCollectionViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIColor+Hex.h>
#import "TitleCollectionViewCell.h"

@implementation TitleCollectionViewCell
- (void)awakeFromNib
{
    self.backgroundColor = [UIColor colorWithHex:0xefefef];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.backgroundColor = ( selected ? [UIColor colorWithHex:0x33393d] : [UIColor colorWithHex:0xefefef]);
    self.titleLabel.textColor = ( selected ? [UIColor whiteColor] : [UIColor blackColor] );
}

@end
