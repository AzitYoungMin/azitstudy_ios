//
//  ScoreBoardInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 29..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ScoreBoardInfo.h"

@implementation ScoreBoardInfo

- (id)initWithTitle:(NSString*)title
{
    self = [super init];
    if( self ){
        self.title = title;
    }
    
    return self;
}

@end
