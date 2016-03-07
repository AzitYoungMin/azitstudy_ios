//
//  PercentChartInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 29..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "PercentChartInfo.h"

@implementation BarChartItemInfo

- (id)initWithValue:(float)value title:(NSString*)title
{
    self = [super init];
    if( self ){
        self.value = value;
        self.title = title;
    }
    
    return self;
}

@end

@implementation PercentChartInfo

- (id)initWithTitle:(NSString*)title items:(NSArray*)items
{
    self = [super init];
    if( self ){
        self.title = title;
        self.itemArray = [NSMutableArray arrayWithArray:items];
    }
    
    return self;
}

@end
