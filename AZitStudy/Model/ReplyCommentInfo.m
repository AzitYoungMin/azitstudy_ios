//
//  ReplyCommentInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ReplyCommentInfo.h"
#import "DateHelper.h"

@implementation ReplyCommentInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.replyId = [data safeObjectForKey:@"reply_id"];
        self.article = [data safeObjectForKey:@"reply_article"];
        self.replyImage = [data safeObjectForKey:@"reply_images"];
        self.writerName = [data safeObjectForKey:@"writer"];
        self.profileImage = [data safeObjectForKey:@"profile_image"];
        self.writerId = [data safeObjectForKey:@"user_id"];
        self.writerRole = [data safeObjectForKey:@"role_of_writer"];
        self.createDate = [DateHelper dateFromString:[data safeObjectForKey:@"created_at"] withFormat:@"yyyy-MM-dd HH:mm"];
        self.likeCount = [data safeObjectForKey:@"num_of_like"];
        self.replyCount = [data safeObjectForKey:@"num_of_reply"];
        self.isSelectLike = [[data safeObjectForKey:@"click_like"] boolValue];
    }
    
    return self;
}

@end
