//
//  PieChartInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 27..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "PieChartInfo.h"

@implementation PieChartInfo

- (id)initWithRate:(float)rate color:(UIColor*)color
{
    self = [super init];
    if( self ){
        self.rate = rate;
        self.fillColor = color;
    }
    
    return self;
}
@end
