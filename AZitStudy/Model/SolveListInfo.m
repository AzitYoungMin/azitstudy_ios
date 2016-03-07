//
//  SolveListInfo.m
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "SolveListInfo.h"
#import "ImageInfo.h"
#import "DateHelper.h"

@implementation SolveListInfo

- (id)initWithData:(id)data
{
    self = [super initWithData:data];
    if( self ){
        self.postId = [data safeObjectForKey:@"posting_id"];
        self.title = [data safeObjectForKey:@"title"];
        self.contents = [data safeObjectForKey:@"contents"];
        self.classYear = [data safeObjectForKey:@"year"];
        self.writerName = [data safeObjectForKey:@"writer"];
        self.writerId = [data safeObjectForKey:@"user_id"];
        self.imageCount = [data safeObjectForKey:@"num_of_images"];
        if( [data safeObjectForKey:@"images"] )
            self.imageArray = [self parseArrayResultForClass:[ImageInfo class] withArray:[data safeObjectForKey:@"images"]];
        self.createDate = [DateHelper dateFromString:[data safeObjectForKey:@"created_at"] withFormat:@"yyyy-MM-dd HH:mm:ss"];
        self.replyCount = [data safeObjectForKey:@"num_of_reply"];
        self.isAnswered = [[data safeObjectForKey:@"is_answered"] boolValue];
        self.bookText = [data safeObjectForKey:@"textbook"];
        self.article = [data safeObjectForKey:@"article"];
        self.profileImage = [data safeObjectForKey:@"profile_image"];
    }
    
    return self;
}
@end
