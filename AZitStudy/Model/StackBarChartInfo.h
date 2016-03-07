//
//  StackBarChartInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ModelBase.h"

@interface StackBarChartInfo : ModelBase

@property (assign, nonatomic) CGFloat rate;
@property (assign, nonatomic) NSInteger score;
@property (strong, nonatomic) UIColor *fillColor;

- (id)initWithRate:(CGFloat)rate score:(NSInteger)score color:(UIColor*)color;

@end
