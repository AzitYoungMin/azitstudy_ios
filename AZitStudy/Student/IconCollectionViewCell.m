//
//  IconCollectionViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "IconCollectionViewCell.h"

@implementation IconCollectionViewCell

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.backgroundColor = ( selected ? [UIColor colorWithHex:0x33393d] : [UIColor whiteColor]);
}
@end
