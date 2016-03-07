//
//  PieChartInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ModelBase.h"

@interface PieChartInfo : ModelBase

@property (assign, nonatomic) float rate;
@property (strong, nonatomic) UIColor *fillColor;

- (id)initWithRate:(float)rate color:(UIColor*)color;

@end
