//
//  StackBarChartInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "StackBarChartInfo.h"

@implementation StackBarChartInfo

- (id)initWithRate:(CGFloat)rate score:(NSInteger)score color:(UIColor*)color
{
    self = [super init];
    if( self ){
        self.rate = rate;
        self.score = score;
        self.fillColor = color;
    }
    
    return self;
}

@end
