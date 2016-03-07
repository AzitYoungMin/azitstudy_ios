//
//  SolveDetailInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SolveDetailInfo.h"
#import "ReplyCommentInfo.h"
#import "SolveAnswerInfo.h"
#import "ImageInfo.h"
#import "DateHelper.h"

@implementation SolveDetailInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        NSData *contentsData = [[data safeObjectForKey:@"contents"] dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *contentsDict = [NSJSONSerialization JSONObjectWithData:contentsData options:0 error:nil];
        
        self.postId = [contentsDict safeObjectForKey:@"posting_id"];
        self.title = [contentsDict safeObjectForKey:@"title"];
        self.writerName = [contentsDict safeObjectForKey:@"writer"];
        self.writerId = [contentsDict safeObjectForKey:@"user_id"];
        self.article = [contentsDict safeObjectForKey:@"article"];
        self.imageCount = [contentsDict safeObjectForKey:@"num_of_images"];
        if( [contentsDict safeObjectForKey:@"images"] )
            self.imageArray = [self parseArrayResultForClass:[ImageInfo class] withArray:[contentsDict safeObjectForKey:@"images"]];
        self.createDate = [DateHelper dateFromString:[contentsDict safeObjectForKey:@"created_at"] withFormat:@"yyyy-MM-dd HH:mm:ss"];
        self.replyCount = [contentsDict safeObjectForKey:@"num_of_reply"];
        if( [contentsDict safeObjectForKey:@"replies"] )
            self.replyArray = [self parseArrayResultForClass:[ReplyCommentInfo class] withArray:[contentsDict safeObjectForKey:@"replies"]];
        else
            self.replyArray = [NSMutableArray array];
        if( [contentsDict safeObjectForKey:@"answers"] )
            self.answerArray = [self parseArrayResultForClass:[SolveAnswerInfo class] withArray:[contentsDict safeObjectForKey:@"answers"]];
        else
            self.answerArray = [NSMutableArray array];
        self.isChosen = [[contentsDict safeObjectForKey:@"is_chosen"] boolValue];
        self.answerCount = [data safeObjectForKey:@"num_of_answers"];
    }
    
    return self;
}

@end
