//
//  EmailCheckResult.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 22..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "EmailCheckResult.h"

@implementation EmailCheckResult

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.isDuplicated = [[data safeObjectForKey:@"is_duplicated"] boolValue];
    }
    
    return self;
}

@end
