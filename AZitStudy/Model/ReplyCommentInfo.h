//
//  ReplyCommentInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface ReplyCommentInfo : ModelBase

@property (strong, nonatomic) NSNumber *replyId;
@property (strong, nonatomic) NSString *article;
@property (strong, nonatomic) NSString *replyImage;
@property (strong, nonatomic) NSString *writerName;
@property (strong, nonatomic) NSString *profileImage;
@property (strong, nonatomic) NSNumber *writerId;
@property (strong, nonatomic) NSString *writerRole;
@property (strong, nonatomic) NSDate *createDate;
@property (strong, nonatomic) NSNumber *likeCount;
@property (strong, nonatomic) NSNumber *replyCount;
@property (assign, nonatomic) BOOL isSelectLike;

@end
