//
//  SubjectPieCartInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SubjectPieCartInfo.h"

@implementation SubjectPieCartInfo

- (id)initWithRate:(float)rate color:(UIColor *)color title:(NSString*)title time:(NSTimeInterval)time
{
    self = [super initWithRate:rate color:color];
    if( self ){
        self.title = title;
        self.time = time;
    }
    
    return self;
}

@end
