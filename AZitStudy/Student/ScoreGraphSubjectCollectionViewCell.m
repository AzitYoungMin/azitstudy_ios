//
//  ScoreGraphSubjectCollectionViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIColor+Hex.h>
#import "ScoreGraphSubjectCollectionViewCell.h"

@implementation ScoreGraphSubjectCollectionViewCell

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.backgroundColor = ( selected ? [UIColor colorWithHex:0x1fb4ff] : [UIColor colorWithHex:0x33393d] );
}

@end
