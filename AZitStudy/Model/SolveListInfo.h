//
//  SolveListInfo.h
//  AZitStudy
//
//  Created by coanyaa on 2016. 2. 28..
//  Copyright © 2016년 Joy2x. All rights reserved.
//

#import "ModelBase.h"

@interface SolveListInfo : ModelBase

@property (strong, nonatomic) NSNumber *postId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *contents;
@property (strong, nonatomic) NSNumber *classYear;
@property (strong, nonatomic) NSString *writerName;
@property (strong, nonatomic) NSNumber *writerId;
@property (strong, nonatomic) NSNumber *imageCount;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSDate *createDate;
@property (strong, nonatomic) NSNumber *replyCount;
@property (assign, nonatomic) BOOL isAnswered;
@property (strong, nonatomic) NSString *bookText;
@property (strong, nonatomic) NSString *article;
@property (strong, nonatomic) NSString *profileImage;

@end
