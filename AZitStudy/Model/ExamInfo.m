//
//  ExamInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ExamInfo.h"

@implementation ExamInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.examId = [data safeObjectForKey:@"exam_id"];
        self.title = [data safeObjectForKey:@"title"];
        self.hasScore = [[data safeObjectForKey:@"has_score"] boolValue];
    }
    
    return self;
}

@end
