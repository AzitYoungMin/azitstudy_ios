//
//  SolveAnswerInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SolveAnswerInfo.h"
#import "DateHelper.h"

@implementation SolveAnswerInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.answerId = [data safeObjectForKey:@"answer_id"];
        self.article = [data safeObjectForKey:@"answer_article"];
        self.writerId = [data safeObjectForKey:@"user_id"];
        self.writerName = [data safeObjectForKey:@"writer"];
        self.profileImage = [data safeObjectForKey:@"profile_image"];
        self.createDate = [DateHelper dateFromString:[data safeObjectForKey:@"created_at"] withFormat:@"yyyy-MM-dd HH:mm"];
        self.isChoosen = [[data safeObjectForKey:@"is_chosen"] boolValue];
        self.score = [data safeObjectForKey:@"score"];
        self.replyCount = [data safeObjectForKey:@"num_of_replies"];
        
    }
    
    return self;
}


@end
