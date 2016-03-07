//
//  StudentInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 24..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "StudentInfo.h"
#import "ExamInfo.h"

@implementation StudentInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.studentId = [data safeObjectForKey:@"student_id"];
        self.name = [data safeObjectForKey:@"name"];
        self.profileImage = [data safeObjectForKey:@"profile_image"];
        self.goalAchieves = [[data safeObjectForKey:@"goal_achieve"] componentsSeparatedByString:@","];
        if( [data safeObjectForKey:@"student_exam"] )
            self.examArray = [self parseArrayResultForClass:[ExamInfo class] withArray:[data safeObjectForKey:@"student_exam"]];
    }
    
    return self;
}

@end
