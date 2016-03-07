//
//  MentorProfilInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "MentorProfilInfo.h"

@implementation MentorProfilInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.university = [data safeObjectForKey:@"university"];
        self.major = [data safeObjectForKey:@"major"];
        self.subjectArray = [[data safeObjectForKey:@"subjects"] componentsSeparatedByString:@","];
    }
    
    return self;
}

@end
