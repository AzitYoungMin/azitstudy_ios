//
//  SubjectCollectionViewCell.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 26..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import <UIColor+Hex.h>
#import "SubjectCollectionViewCell.h"

@implementation SubjectCollectionViewCell

- (void)awakeFromNib
{
    _titleLabel.textColor = [UIColor lightGrayColor];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.titleLabel.textColor = ( selected ? [UIColor whiteColor] : [UIColor lightGrayColor] );
}

@end
