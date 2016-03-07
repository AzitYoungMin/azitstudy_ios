//
//  SubjectInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SubjectInfo.h"

@implementation SubjectInfo

- (id)initWithSubject:(NSString*)subject time:(NSTimeInterval)time ranking:(NSNumber*)ranking
{
    self = [super init];
    if( self ){
        self.subject = subject;
        self.studyTime = time;
        self.topRanking = ranking;
    }
    
    return self;
}

@end
