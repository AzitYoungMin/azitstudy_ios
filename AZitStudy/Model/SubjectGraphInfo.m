//
//  SubjectGraphInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SubjectGraphInfo.h"

@implementation SubjectGraphInfo

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
